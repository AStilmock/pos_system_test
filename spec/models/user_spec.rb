require 'rails_helper'

RSpec.describe User, type: :model do
  describe "relationships" do
    it { should have_many :invoices }
    it { should have_many :purchase_orders }
    it { should have_many :sales }
  end

  describe "validations" do
    it { should validate_presence_of :username }
    it { should validate_uniqueness_of :username }
    it { should validate_presence_of :email }
    it { should validate_uniqueness_of :email }
    it { should validate_presence_of :crypted_password }
    it { should validate_length_of :crypted_password }
    it { should validate_confirmation_of :crypted_password }
    it { should validate_presence_of :password_confirmation}
  end
end
