require 'rails_helper'

RSpec.describe Item, type: :model do
  describe "relationships" do
    it { should have_many :purchase_orders }
    it { should have_many :invoices }
    it { should belong_to :vendor }
  end

  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :description }
    it { should validate_presence_of :unit_price }
    it { should validate_presence_of :item_cost }
    it { should validate_presence_of :quantity }
  end
end
