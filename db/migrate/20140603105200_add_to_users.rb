class AddToUsers < ActiveRecord::Migration
  def change
    add_column :users, :login, :string
    add_column :users, :group_strings, :string
    remove_column :users, :password_digest
  end
end
