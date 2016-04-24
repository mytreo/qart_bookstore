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

    create_join_table :authors,:books do |t|
      t.index :author_id
      t.index :book_id
    end

    add_index :books, :name
    add_index :books, :isbn, unique: true
    add_index :authors, :name
  end
end
