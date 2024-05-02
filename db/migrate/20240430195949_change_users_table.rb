class ChangeUsersTable < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :password_digest
    add_column :users, :password, :string
    add_column :users, :crypted_password, :string
    add_column :users, :salt, :string
  end
end
