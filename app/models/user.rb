class User < ApplicationRecord
  authenticates_with_sorcery!

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  validates :email, uniqueness: true
  
  has_many :invoices
  has_many :purchase_orders
  has_many :sales

  enum permission: [:basic, :employee, :manager, :admin, :super]
  enum discount_level: [:customer, :friends_family_loyalty, :owner_manager]

  has_secure_password


  
end
