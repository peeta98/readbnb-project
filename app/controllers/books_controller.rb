class BooksController < ApplicationController
  def index
    @books = Book.all
    @action_books = Book.search_by_genre("Action")
    @terror_books = Book.search_by_genre("Terror")
    @comedy_books = Book.search_by_genre("Comedy")
    @drama_books = Book.search_by_genre("Drama")
    @fiction_books = Book.search_by_genre("Fiction")
  end

  def show
    @book = Book.find(params[:id])
  end
end
