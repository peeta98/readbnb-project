class Book < ApplicationRecord
  has_many :reviews
  has_many :user_books
end
