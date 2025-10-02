class BooksController < ApplicationController
  allow_unauthenticated_access only: %i[ index ]

  def index
    @books = Book.all
    @books = @books.search_by_title_and_authors(params[:query]) if params[:query].present?
    @books = @books.order(created_at: :desc)
  end

  def show
    @book = Book.find(params[:id])
  end

  private

  def query_books
    Book.search_by_title_and_authors(params[:query])
  end
end
