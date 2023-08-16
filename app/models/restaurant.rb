class Restaurant < ApplicationRecord
  CATEGORY = %w[chinese italian japanese french belgian].freeze
  # freeze allows you to fix categories so it can't be changed later

  validates :name, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true
  validates :category, inclusion: { in: CATEGORY }, presence: true
  has_many :reviews, dependent: :destroy
  # allows us to do @restaurant.reviews
end
