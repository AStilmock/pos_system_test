class Discount < ApplicationRecord
  has_many :item
  has_many :invoice

  validates :name, presence: true, uniqueness: true
  validates :category, presence: true
  validates :description, presence: true
  validates :price_percent, presence: true
  validates :amount, presence: true
end
