class Order < ActiveRecord::Base
  validates :name, :address, :email , presence: true
  has_many :line_items, dependent: :destroy
  belongs_to :user

  def add_line_items_from_cart(cart)
      cart.line_items.each do |item|
      item.cart_id = nil
      line_items << item
    end
  end

  def total_price
    line_items.to_a.sum{|item| item.total_price}
  end

  def change_quantity(items)
    items.each do |item|
      item.book.quantity+=9999
    end
  end

end