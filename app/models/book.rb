class Book < ActiveRecord::Base
  belongs_to :genre
  has_and_belongs_to_many :authors
  has_many :line_items

  before_destroy :ensure_not_referenced_by_any_line_item

  validates :name, presence: true
  validates :price, presence: true, numericality: {greater_than_or_equal_to: 0.00}
  validates :quantity, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0}
  validates :sold, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0}
  ISBN_REGEX = /\A(0|(97(8|9))){1}[-]{1}[0-9]{3}[-]{1}[0-9]{5}[-]{1}[0-9]{0,1}\z/i
  validates :isbn,presence: true, uniqueness: { case_sensitive: false }, format: {with: ISBN_REGEX}

  private
    def ensure_not_referenced_by_any_line_item
      if line_items.empty?
        return true
      else
        errors.add(:base,'some of this books are in active cart')
        return false
      end
    end
end
