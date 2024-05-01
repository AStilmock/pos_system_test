class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email,            null: false, index: { unique: true }
      t.string :password_digest
      t.integer :permission
      t.integer :discount_level
      
      t.timestamps
    end
  end
end
