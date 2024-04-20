require 'rails_helper'

RSpec.describe Invoice, type: :model do
  describe "relationships" do
    # it { should belong_to :sale }
    it { should belong_to :user }
    # it { should have_many :items }
    # it { should have_many :discounts }
  end

  describe "validations" do
    it { should validate_presence_of :date_time }
    it { should validate_presence_of :quantity}
    it { should validate_presence_of :sub_total_sale_price }
    it { should validate_presence_of :final_sale_price }
  end
end
