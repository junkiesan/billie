class ImportBookService

  def initialize(isbn_book)
    @isbn_book = isbn_book
  end

  def call
    url = "https://www.googleapis.com/books/v1/volumes?q=isbn:#{@isbn_book}&key=#{ENV["GOOGLE_BOOKS_API_KEY"]}"
    response = HTTParty.get(url)
    result = response.parsed_response
    books = result["items"]
    title = books.first["volumeInfo"]["title"]
    author = books.first["volumeInfo"]["authors"][0]
    description = books.first["volumeInfo"]["description"]
    editor = books.first["volumeInfo"]["publisher"]
    # genre = books.first["volumeInfo"]["categories"] = nil ? "undifined" : books.first["volumeInfo"]["categories"]
    # image = books.first["volumeInfo"]["imageLinks"] != nil ? books.first["volumeInfo"]["imageLinks"]["thumbnail"] : ""

    genre = books.first["volumeInfo"]["categories"] || "undifined"
    image = books.first["volumeInfo"]["imageLinks"] || ""
    [title, author, description, editor, genre, image]
  end
end
