module SorceryModel
  # This module handles all plugin operations which are related to the Model layer in the MVC pattern.
  # It should be included into the ORM base class.
  # In the case of Rails this is usually ActiveRecord (actually, in that case, the plugin does this automatically).
  #
  # When included it defines a single method: 'authenticates_with_sorcery!'
  # which when called adds the other capabilities to the class.
  # This method is also the place to configure the plugin in the Model layer.
  module Model
    def authenticates_with_sorcery!
      @sorcery_config = Config.new

      extend ClassMethods # included here, before submodules, so they can be overriden by them.
      include InstanceMethods
      include TemporaryToken

      include_required_submodules!

      # This runs the options block set in the initializer on the model class.
      ::Sorcery::Controller::Config.user_config.tap { |blk| blk.call(@sorcery_config) if blk }

      define_base_fields
      init_orm_hooks!

      @sorcery_config.after_config << :add_config_inheritance if @sorcery_config.subclasses_inherit_config
      @sorcery_config.after_config.each { |c| send(c) }
    end

    private

    def define_base_fields
      class_eval do
        sorcery_config.username_attribute_names.each do |username|
          sorcery_adapter.define_field username, String, length: 255
        end
        unless sorcery_config.username_attribute_names.include?(sorcery_config.email_attribute_name)
          sorcery_adapter.define_field sorcery_config.email_attribute_name, String, length: 255
        end
        sorcery_adapter.define_field sorcery_config.crypted_password_attribute_name, String, length: 255
        sorcery_adapter.define_field sorcery_config.salt_attribute_name, String, length: 255
      end
    end

    # includes required submodules into the model class,
    # which usually is called User.
    def include_required_submodules!
      class_eval do
        @sorcery_config.submodules = ::Sorcery::Controller::Config.submodules
        @sorcery_config.submodules.each do |mod|
          # TODO: Is there a cleaner way to handle missing submodules?
          # rubocop:disable Lint/HandleExceptions
          begin
            include Submodules.const_get(mod.to_s.split('_').map(&:capitalize).join)
          rescue NameError
            # don't stop on a missing submodule. Needed because some submodules are only defined
            # in the controller side.
          end
          # rubocop:enable Lint/HandleExceptions
        end
      end
    end

    # add virtual password accessor and ORM callbacks.
    def init_orm_hooks!
      sorcery_adapter.define_callback :before, :validation, :encrypt_password, if: proc { |record|
        record.send(sorcery_config.password_attribute_name).present?
      }

      sorcery_adapter.define_callback :after, :save, :clear_virtual_password, if: proc { |record|
        record.send(sorcery_config.password_attribute_name).present?
      }

      attr_accessor sorcery_config.password_attribute_name
    end

    module ClassMethods
      # Returns the class instance variable for configuration, when called by the class itself.
      def sorcery_config
        @sorcery_config
      end

      # The default authentication method.
      # Takes a username and password,
      # Finds the user by the username and compares the user's password to the one supplied to the method.
      # returns the user if success, nil otherwise.
      def authenticate(*credentials, &block)
        raise ArgumentError, 'at least 2 arguments required' if credentials.size < 2

        if credentials[0].blank?
          return authentication_response(return_value: false, failure: :invalid_login, &block)
        end

        if @sorcery_config.downcase_username_before_authenticating
          credentials[0].downcase!
        end

        user = sorcery_adapter.find_by_credentials(credentials)

        unless user
          return authentication_response(failure: :invalid_login, &block)
        end

        set_encryption_attributes

        if user.respond_to?(:active_for_authentication?) && !user.active_for_authentication?
          return authentication_response(user: user, failure: :inactive, &block)
        end

        @sorcery_config.before_authenticate.each do |callback|
          success, reason = user.send(callback)

          unless success
            return authentication_response(user: user, failure: reason, &block)
          end
        end

        unless user.valid_password?(credentials[1])
          return authentication_response(user: user, failure: :invalid_password, &block)
        end

        authentication_response(user: user, return_value: user, &block)
      end

      # encrypt tokens using current encryption_provider.
      def encrypt(*tokens)
        return tokens.first if @sorcery_config.encryption_provider.nil?

        set_encryption_attributes

        CryptoProviders::AES256.key = @sorcery_config.encryption_key
        @sorcery_config.encryption_provider.encrypt(*tokens)
      end

      # FIXME: This method of passing config to the hashing provider is
      #        questionable, and has been refactored in Sorcery v1.
      def set_encryption_attributes
        @sorcery_config.encryption_provider.stretches = @sorcery_config.stretches if @sorcery_config.encryption_provider.respond_to?(:stretches) && @sorcery_config.stretches
        @sorcery_config.encryption_provider.join_token = @sorcery_config.salt_join_token if @sorcery_config.encryption_provider.respond_to?(:join_token) && @sorcery_config.salt_join_token
        @sorcery_config.encryption_provider.pepper = @sorcery_config.pepper if @sorcery_config.encryption_provider.respond_to?(:pepper) && @sorcery_config.pepper
      end

      protected

      def authentication_response(options = {})
        yield(options[:user], options[:failure]) if block_given?

        options[:return_value]
      end

      def add_config_inheritance
        class_eval do
          def self.inherited(subclass)
            subclass.class_eval do
              class << self
                attr_accessor :sorcery_config
              end
            end
            subclass.sorcery_config = sorcery_config
            super
          end
        end
      end
    end

    module InstanceMethods
      # Returns the class instance variable for configuration, when called by an instance.
      def sorcery_config
        self.class.sorcery_config
      end

      # identifies whether this user is regular, i.e. we hold his credentials in our db,
      # or that he is external, and his credentials are saved elsewhere (twitter/facebook etc.).
      def external?
        send(sorcery_config.crypted_password_attribute_name).nil?
      end

      # Calls the configured encryption provider to compare the supplied password with the encrypted one.
      def valid_password?(pass)
        crypted = send(sorcery_config.crypted_password_attribute_name)
        return crypted == pass if sorcery_config.encryption_provider.nil?

        # Ensure encryption provider is using configured values
        self.class.set_encryption_attributes

        salt = send(sorcery_config.salt_attribute_name) unless sorcery_config.salt_attribute_name.nil?

        sorcery_config.encryption_provider.matches?(crypted, pass, salt)
      end

      protected

      # creates new salt and saves it.
      # encrypts password with salt and saves it.
      def encrypt_password
        config = sorcery_config
        send(:"#{config.salt_attribute_name}=", new_salt = TemporaryToken.generate_random_token) unless config.salt_attribute_name.nil?
        send(:"#{config.crypted_password_attribute_name}=", self.class.encrypt(send(config.password_attribute_name), new_salt))
      end

      def clear_virtual_password
        config = sorcery_config
        send(:"#{config.password_attribute_name}=", nil)

        return unless respond_to?(:"#{config.password_attribute_name}_confirmation=")

        send(:"#{config.password_attribute_name}_confirmation=", nil)
      end

      # calls the requested email method on the configured mailer
      # supports both the ActionMailer 3 way of calling, and the plain old Ruby object way.
      def generic_send_email(method, mailer)
        config = sorcery_config
        mail = config.send(mailer).send(config.send(method), self)
        return unless mail.respond_to?(config.email_delivery_method)

        mail.send(config.email_delivery_method)
      end
    end
  end
end