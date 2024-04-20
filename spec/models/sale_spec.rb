require 'rails_helper'

RSpec.describe Sale, type: :model do
  describe "relationships" do
    it { should belong_to :invoice }
    it { should belong_to :user }
  end

  describe "validations" do
    it { should validate_presence_of :date_time }
    it { should validate_presence_of :sub_total_sale_price }
    it { should validate_presence_of :shipping }
    it { should validate_presence_of :taxes }
    it { should validate_presence_of :total_sale_price }
  end
end
