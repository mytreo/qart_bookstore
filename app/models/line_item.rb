class LineItem < ActiveRecord::Base
  belongs_to :book
  belongs_to :cart
  belongs_to :order

  before_destroy :ensure_not_referenced_by_any_order

  def total_price
    book.price * quantity
  end

  private
  def ensure_not_referenced_by_any_order
    if order.nil?
      return true
    else
      errors.add(:base,'this item is in order')
      return false
    end
  end
end
