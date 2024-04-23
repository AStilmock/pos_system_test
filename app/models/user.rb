class User < ApplicationRecord
  has_many :invoices
  has_many :purchase_orders
  has_many :sales

  validates :username, uniqueness: true, presence: true
  validates :email, uniqueness: true, presence: true
  validates :password, presence: true, confirmation: true

  enum permission: [:customer, :employee, :manager, :admin, :super]
  enum discount_level: [:customer, :friends_family_loyalty, :owner_manager]

  has_secure_password
end
