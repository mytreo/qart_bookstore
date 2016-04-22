class CreateBooksGenresAuthors < ActiveRecord::Migration
  def change
    create_table :genres do |t|
      t.string :name
      t.timestamps null: false
    end

    create_table :books do |t|
      t.string :name
      t.float :price
      t.integer :quantity
      t.integer :sold
      t.integer :year
      t.string :isbn
      t.string :description
      t.belongs_to :genre, index: true
      t.timestamps null: false
    end

    create_table :authors do |t|
      t.string :name
      t.string :description
      t.timestamps null: false
    end

    create_table :authors_books, id: false do |t|
      t.belongs_to :book, index: true
      t.belongs_to :author, index: true
    end

    add_index :books , :name
    add_index :authors , :name
  end
end
