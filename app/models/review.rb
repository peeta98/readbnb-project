class Review < ApplicationRecord
  belongs_to :book
  belongs_to :user

  validates :rating, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
end
