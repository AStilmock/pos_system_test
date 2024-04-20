require 'rails_helper'

RSpec.describe Vendor, type: :model do
  describe "relationships" do
    it { should have_many :purchase_orders }
    it { should have_many :items }
  end

  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :description }
    it { should validate_presence_of :address }
    it { should validate_presence_of :email }
    it { should validate_presence_of :phone }
  end
end
