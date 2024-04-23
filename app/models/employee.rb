class Employee < ApplicationRecord
  belongs_to :user

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :address, presence: true
  validates :phone, presence: true

  enum category: [:employee, :manager, :admin, :owner]
end
