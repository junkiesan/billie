class BooksController < ApplicationController
  before_action :set_books, only: [:show]
  skip_before_action :authenticate_user!

  def index
    skip_policy_scope
    # authorize @book
    @books = Book.all
  end

  def show
    authorize @book
  end

  private

  def set_books
    @book = Book.find(params[:id])
  end
end
