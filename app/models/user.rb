class User < ApplicationRecord
  has_many :invoices
  has_many :purchase_orders
  has_many :sales

  validates :username, uniqueness: true, presence: true
  validates :email, uniqueness: true, presence: true
  validates :password, presence: true, confirmation: true

  has_secure_password
end
