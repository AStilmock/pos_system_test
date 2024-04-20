class ProductCategory < ApplicationRecord
  has_many :items

  validates :name, presence: true
  validates :description, presence: true
end
