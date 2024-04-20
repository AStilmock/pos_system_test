class Item < ApplicationRecord
  has_many :purchase_orders
  has_many :invoices
  belongs_to :vendor

  validates :name, presence: true
  validates :description, presence: true
  validates :unit_price, presence: true
  validates :item_cost, presence: true
  validates :quantity, presence: true
end
