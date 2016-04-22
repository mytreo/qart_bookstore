class AddSomeUniqueIndexes < ActiveRecord::Migration
  def change
    add_index :users, :email, unique: true
    add_index :users, :login, unique: true
    add_index :books, :isbn, unique: true
  end
end
