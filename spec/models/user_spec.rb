require 'rails_helper'

RSpec.describe User, type: :model do
  describe "relationships" do
    it { should have_many :invoices }
    it { should have_many :purchase_orders }
    it { should have_many :sales }
  end

  describe "validations" do
    # xit { should validate_presence_of :crypted_password }
    it { should validate_length_of :crypted_password }
    # xit { should validate_confirmation_of :crypted_password }
    # xit { should validate_presence_of :password_confirmation}
  end
end
