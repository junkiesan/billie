class BooksController < ApplicationController
  before_action :set_books, only: [:show]
  skip_before_action :authenticate_user!

  def index
    @books = Book.all
  end

  def show
  end

  private

  def set_books
    @book = Book.find(params[:id])
  end
end
