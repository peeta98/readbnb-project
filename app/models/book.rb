class Book < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :user_books

  def search_by_genre(genre)
    return Book.where(genre:)
  end
end
