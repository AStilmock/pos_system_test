class CreatePurchaseOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :purchase_orders do |t|
      t.string :description
      t.datetime :date_time
      t.references :vendor, null: false, foreign_key: true
      t.references :item, null: false, foreign_key: true
      t.integer :quantity
      t.integer :complete
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
