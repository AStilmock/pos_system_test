class CreateVendor < ActiveRecord::Migration[7.0]
  def change
    create_table :vendors do |t|
      t.string :name
      t.string :description
      t.string :address
      t.string :email
      t.integer :phone

      t.timestamps
    end
  end
end
