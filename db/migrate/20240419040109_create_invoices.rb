class CreateInvoices < ActiveRecord::Migration[7.0]
  def change
    create_table :invoices do |t|
      t.datetime :date_time
      t.references :user, null: false, foreign_key: true
      t.references :item, null: false, foreign_key: true
      t.integer :quantity
      t.references :discount, null: false, foreign_key: true
      t.integer :sub_total_sale_price
      t.integer :final_sale_price
      t.boolean :complete

      t.timestamps
    end
  end
end
