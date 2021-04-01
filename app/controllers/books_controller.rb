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
    @quagga_result = params[:isbn]
    # @matching = @book.isbn.match(/^(?:ISBN(?:-13)?:?\ )?(?=[0-9]{13}$|(?=(?:[0-9]+[-\ ]){4})[-\ 0-9]{17}$)97[89][-\ ]?[0-9]{1,5}[-\ ]?[0-9]+[-\ ]?[0-9]+[-\ ]?[0-9]$/)
    scan_numbers = @quagga_result.split(',')
    match_scan_numbers = scan_numbers.first.map {|num| num.match(/\d+/) }
    string_scan_numbers = match_scan_numbers.map { |n| n.to_s}
    array_isbn = string_scan_numbers.map { |n| n.match(/^(?:ISBN(?:-13)?:?\ )?(?=[0-9]{13}$|(?=(?:[0-9]+[-\ ]){4})[-\ 0-9]{17}$)97[89][-\ ]?[0-9]{1,5}[-\ ]?[0-9]+[-\ ]?[0-9]+[-\ ]?[0-9]$/) }
    good_isbn = array_isbn.select { |n| n != nil }
    isbn = good_isbn.first.to_s
    @book.isbn = isbn
  end

  def get_barcode
    @book = Book.find_or_initialize_by(isbn: params[:isbn])

    unless @book.new_record?
      redirect_to @book
    else
      redirect_to new_book_path(isbn: params[:isbn])
    end
  end

  private

  def set_books
    @book = Book.find(params[:id])
  end
end

