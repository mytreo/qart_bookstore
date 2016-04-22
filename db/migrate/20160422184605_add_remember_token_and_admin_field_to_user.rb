class AddRememberTokenAndAdminFieldToUser < ActiveRecord::Migration
  def change
    add_column :users, :remember_token, :string
    add_column :users, :admin, :boolean, default: false
    add_index  :users, :remember_token
  end
end
