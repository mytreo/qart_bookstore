class Order < ActiveRecord::Base
  validates :name, :address, :email , presence: true
  has_many :line_items, dependent: :destroy
  belongs_to :user

  def add_line_items_from_cart(cart)
      cart.line_items.each do |item|
      item.cart_id = nil
      line_items << item
      if item.quantity > item.book.quantity
        return false
      end
      end
    true
  end

  def total_price
    line_items.to_a.sum{|item| item.total_price}
  end

end