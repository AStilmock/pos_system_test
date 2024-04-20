class CreateSales < ActiveRecord::Migration[7.0]
  def change
    create_table :sales do |t|
      t.datetime :date_time
      t.references :invoice, null: false, foreign_key: true
      t.references :discount, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.integer :sub_total_sale_price
      t.integer :shipping
      t.integer :taxes
      t.integer :total_sale_price
      t.integer :complete


      t.timestamps
    end
  end
end
