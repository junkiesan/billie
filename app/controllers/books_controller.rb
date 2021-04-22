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
    @book.save!
    redirect_to book_path(@book)
  end

  def get_barcode
    @book = Book.new
    @book.isbn = BarcodeService.new(params[:isbn]).call
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

      redirect_to new_book_path(id: Book.last.id + 1,
                                title: title,
                                isbn: @book.isbn,
                                author: author,
                                description: description,
                                editor: editor,
                                genre: genre,
                                image: image)
    end
  end

  private

  def set_books
    @book = Book.find(params[:id])
  end
end

