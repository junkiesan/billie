# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# puts "Destroying Books..."
# Book.destroy_all

# puts "Creating one book"
admin = User.new
# Book.create(title: "Le petit prince",
#             author: "Antoine de Saint Exupéry",
#             description: "Le Petit Prince est une œuvre de langue française, la plus connue d'Antoine de Saint-Exupéry. Publié en 1943 à New York simultanément à sa traduction anglaise1, c'est une œuvre poétique et philosophique sous l'apparence d'un conte pour enfants.Traduit en trois cent soixante et une langues2, Le Petit Prince est le deuxième ouvrage le plus traduit au monde après la Bible3.Le langage, simple et dépouillé, parce qu'il est destiné à être compris par des enfants, est en réalité pour le narrateur le véhicule privilégié d'une conception symbolique de la vie. Chaque chapitre relate une rencontre du petit prince qui laisse celui-ci perplexe, par rapport aux comportements absurdes des « grandes personnes ». Ces différentes rencontres peuvent être lues comme une allégorie.Les aquarelles font partie du texte4 et participent à cette pureté du langage : dépouillement et profondeur sont les qualités maîtresses de l'œuvre.On peut y lire une invitation de l'auteur à retrouver l'enfant en soi, car « toutes les grandes personnes ont d'abord été des enfants. (Mais peu d'entre elles s'en souviennent.) ». L'ouvrage est dédié à Léon Werth, mais « quand il était petit garçon ».",
#             editor: "Poche"
#             )

# puts "#{Book.count} book created"

# url = "https://www.googleapis.com/books/v1/volumes?q=#{params[:search]}&maxResults=15&key=#{ENV["GOOGLE_BOOKS_API_KEY"]}"
url = "https://www.googleapis.com/books/v1/volumes?q=naruto&maxResults=15&key=#{ENV["GOOGLE_BOOKS_API_KEY"]}"
response = HTTParty.get(url)
result = response.parsed_response
books = result["items"]
# p books = result["items"][1]["volumeInfo"]["imageLinks"]["thumbnail"]

books.each do |child|
  book = Book.create!(
    title: child["volumeInfo"]["title"],
    author: child["volumeInfo"]["authors"][0],
    description: child["volumeInfo"]["description"],
    editor: child["volumeInfo"]["publisher"],
    genre: child["volumeInfo"]["categories"] != nil ? child["volumeInfo"]["categories"] : "undifined",
    user: admin,
    image: child["volumeInfo"]["imageLinks"] != nil ? child["volumeInfo"]["imageLinks"]["thumbnail"] : ""
  )
  puts "#{book.title} scraped ! "
  book.save!
end
