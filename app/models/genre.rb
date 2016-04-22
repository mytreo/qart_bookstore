class Genre < ActiveRecord::Base
  has_many :books
  has_and_belongs_to_many :authors

  validates :name, presence: true, length: { maximum: 30 }

end
