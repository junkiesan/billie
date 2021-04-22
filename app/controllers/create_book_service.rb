class CreateBookService

  def initialize(params_barcode, book)
    @params_barcode = params_barcode
    @book = book
  end

  def call
    @book.isbn = @params_barcode[:isbn]
    @book.title = @params_barcode[:title]
    @book.author = @params_barcode[:author]
    @book.description = @params_barcode[:description]
    @book.editor = @params_barcode[:editor]
    @book.genre = @params_barcode[:genre]
    @book.image = @params_barcode[:image]
  end
end
