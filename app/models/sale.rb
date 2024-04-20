class Sale < ApplicationRecord
  belongs_to :invoice
  belongs_to :user

  validates :date_time, presence: true
  validates :sub_total_sale_price, presence: true
  validates :shipping, presence: true
  validates :taxes, presence: true
  validates :total_sale_price, presence: true
end
