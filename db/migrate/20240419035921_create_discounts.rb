class CreateDiscounts < ActiveRecord::Migration[7.0]
  def change
    create_table :discounts do |t|
      t.string :name
      t.string :category
      t.string :description
      t.integer :price_percent
      t.integer :amount

      t.timestamps
    end
  end
end
