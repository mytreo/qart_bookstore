class Book < ActiveRecord::Base
  belongs_to :genre

  validates :name, presence: true
  validates :price, presence: true, numericality: {greater_than_or_equal_to: 0}
  validates :quantity, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0}
  validates :sold, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0}
  ISBN_REGEX = /\A(0|(97(8|9))){1}[-]{1}[0-9]{3}[-]{1}[0-9]{5}[-]{1}[0-9]{0,1}\z/i
  validates :isbn,presence: true, uniqueness: { case_sensitive: false }, format: {with: ISBN_REGEX}


end
