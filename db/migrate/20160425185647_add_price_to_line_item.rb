class AddPriceToLineItem < ActiveRecord::Migration
  def change
    add_column :line_items, :price, :float, null: false, default: 0.00 , precision: 8, scale:2
  end
end