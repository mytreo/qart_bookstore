class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :login
      t.string :email
      t.string :name
      t.string :address
      t.string :password_digest

      t.timestamps null: false
    end

    add_index :users, :email, unique: true
    add_index :users, :login, unique: true
  end
end
