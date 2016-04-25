class Order < ActiveRecord::Base
  validates :name, :address, :email , presence: true
  has_many :line_items, dependent: :destroy

  def add_line_items_from_cart(cart)
      cart.line_items.each do |item|
      item.cart_id = nil
      book = item.book
      book.quantity -=item.quantity
      book.sold +=item.quantity
      line_items << item
    end
  end
end