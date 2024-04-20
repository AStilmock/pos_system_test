class Vendor < ApplicationRecord
  has_many :purchase_orders
  has_many :items
  # has_many :product_categories.through(:items)
  has_many :product_categories, through: :items

  validates_presence_of :name
  validates_presence_of :description
  validates_presence_of :address
  validates_presence_of :email
  validates_presence_of :phone
end
