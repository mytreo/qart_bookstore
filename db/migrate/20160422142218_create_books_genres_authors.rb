class CreateBooksGenresAuthors < ActiveRecord::Migration
  def change
    create_table :genres do |t|
      t.string :name
      t.timestamps null: false
    end

    create_table :books do |t|
      t.string :name, null: false
      t.float :price, null: false, default: 0.00 , precision: 8, scale:2
      t.integer :quantity, null: false, default: 0
      t.integer :sold, null: false, default: 0
      t.integer :year
      t.string :isbn, null: false
      t.string :image_url
      t.text :description
      t.belongs_to :genre, index: true
      t.timestamps null: false
    end

    create_table :authors do |t|
      t.string :name
      t.text :description
      t.timestamps null: false
    end

    create_table :authors_books, id: false do |t|
      t.belongs_to :book, index: true
      t.belongs_to :author, index: true
    end

    add_index :books, :name
    add_index :books, :isbn, unique: true
    add_index :authors, :name
  end
end
