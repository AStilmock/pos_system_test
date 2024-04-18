class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :name
      t.string :description
      t.integer :unit_price
      t.integer :item_cost
      t.integer :quantity
      t.boolean :in_stock
      t.references :product_category, null: false, foreign_key: true
      t.references :discount, null: false, foreign_key: true
      t.references :vendor, null: false, foreign_key: true

      t.timestamps
    end
  end
end
