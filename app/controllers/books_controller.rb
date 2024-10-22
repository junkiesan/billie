class BooksController < ApplicationController
  before_action :set_books, only: [:show, :update]
  # skip_before_action :authenticate_user!

  def index
    @books = Book.all
  end

  def show
    @user = current_user
    @books_user = @user.books
    @user_shelf_list = @books_user.map { |book| book.shelf_list }
  end

  def new
    @book = Book.new
    CreateBookService.new(params, @book).call
    @book.save!
    redirect_to book_path(@book)
  end

  def barcode
    @book = Book.new
    @book.isbn = BarcodeService.new(params[:isbn]).call
    @new_book = Book.find_or_initialize_by(isbn: @book.isbn)
    if @book.isbn == "" || @new_book.new_record?
      redirect_to @new_book
    else
      book_array = ImportBookService.new(@book.isbn).call
      redirect_to new_book_path(title: book_array[0],
                                isbn: @book.isbn,
                                author: book_array[1],
                                description: book_array[2],
                                editor: book_array[3],
                                genre: book_array[4],
                                image: book_array[5])
    end
  end

  def update
    @book.shelf_list.add(params["book"]["shelf_list"])
    @book.update(book_params)
    redirect_to book_path(@book)
  end

  private

  def set_books
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :isbn, :author, :description, :editor, :genre, :image, shelf_list: [])
  end

end
