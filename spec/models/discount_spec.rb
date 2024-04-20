require 'rails_helper'

RSpec.describe Discount, type: :model do
  describe "relationships" do
    it { should have_many :item }
    it { should have_many :invoice }
  end

  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_uniqueness_of :name }
    it { should validate_presence_of :category }
    it { should validate_presence_of :description }
    it { should validate_presence_of :price_percent }
    it { should validate_presence_of :amount }
  end
end
