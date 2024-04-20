require 'rails_helper'

RSpec.describe Employee, type: :model do
  describe "relationships" do
    it { should belong_to :user }
  end

  describe "validations" do
    it { should validate_presence_of :first_name}
    it { should validate_presence_of :last_name}
    it { should validate_presence_of :address}
    it { should validate_presence_of :phone}
  end
end
