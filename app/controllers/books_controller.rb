class BooksController < ApplicationController
  before_action :set_books, only: [:show]
  # skip_before_action :authenticate_user!

  def index
    @books = Book.all
  end

  def show
  end

  def new
    @book = Book.new
    @book.ean_reader = params[:ean_reader]
    p params
  end

  def get_barcode
    @book = Book.find_or_initialize_by(ean_reader: params[:ean_reader])
    unless @book.new_record?
      redirect_to @book
    else
      redirect_to new_book_path(ean_reader: params[:ean_reader])
    end
  end

  private

  def set_books
    @book = Book.find(params[:id])
  end
end

