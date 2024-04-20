class Invoice < ApplicationRecord
  # belongs_to :sale
  belongs_to :user
  # has_many :items
  # has_many :discounts
  
  validates :date_time, presence: true
  validates :quantity, presence: true
  validates :sub_total_sale_price, presence: true
  validates :final_sale_price, presence: true
end
