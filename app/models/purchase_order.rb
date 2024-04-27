class PurchaseOrder < ApplicationRecord
  belongs_to :vendor
  belongs_to :item
  belongs_to :user

  enum complete: [:no, :yes]
end
