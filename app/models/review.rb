class Review < ApplicationRecord
  belongs_to :restaurant
  # allows us to call review.restaurant (who is the parent)

  validates :content, :rating, presence: true
  validates :rating, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 0,
    less_than_or_equal_to: 5
  }
end
