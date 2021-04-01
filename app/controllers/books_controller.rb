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
    @book.isbn = params[:isbn]
    @book.title = params[:title]
    @book.author = params[:author]
    @book.description = params[:description]
    @book.editor = params[:editor]
    @book.genre = params[:genre]
    @book.image = params[:image]
  end
  
  def get_barcode
    @book = Book.new
    @quagga_result = params[:isbn]
    scan_numbers = @quagga_result.split(',')
    match_scan_numbers = scan_numbers.first.map {|num| num.match(/\d+/) }
    string_scan_numbers = match_scan_numbers.map { |n| n.to_s}
    array_isbn = string_scan_numbers.map { |n| n.match(/^(?:ISBN(?:-13)?:?\ )?(?=[0-9]{13}$|(?=(?:[0-9]+[-\ ]){4})[-\ 0-9]{17}$)97[89][-\ ]?[0-9]{1,5}[-\ ]?[0-9]+[-\ ]?[0-9]+[-\ ]?[0-9]$/) }
    good_isbn = array_isbn.select { |n| n != nil }
    isbn = good_isbn.first.to_s
    @book.isbn = isbn
    
    # @book = Book.find_or_initialize_by(isbn: params[:isbn])
    @new_book = Book.find_or_initialize_by(isbn: @book.isbn)
    
    unless @new_book.new_record?
      redirect_to @new_book
    else
      url = "https://www.googleapis.com/books/v1/volumes?q=isbn:#{@book.isbn}&key=#{ENV["GOOGLE_BOOKS_API_KEY"]}"
      response = HTTParty.get(url)
      result = response.parsed_response
      books = result["items"]

      title = books.first["volumeInfo"]["title"]
      author = books.first["volumeInfo"]["authors"][0]
      description = books.first["volumeInfo"]["description"]
      editor = books.first["volumeInfo"]["publisher"]
      genre = books.first["volumeInfo"]["categories"] != nil ? books.first["volumeInfo"]["categories"] : "undifined"
      image = books.first["volumeInfo"]["imageLinks"] != nil ? books.first["volumeInfo"]["imageLinks"]["thumbnail"] : ""

      redirect_to new_book_path(title: title, isbn: @book.isbn, author: author, description: description, editor: editor, genre: genre, image: image)
      # create object with header content
      # redirect show
      # transform #new in #show
      # create service for call api
      # redirect_to new_book_path(isbn: params[:isbn])
    end
  end

  private

  def set_books
    @book = Book.find(params[:id])
  end
end

