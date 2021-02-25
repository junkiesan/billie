FactoryBot.define do
  factory :book do
    title { Faker::Book.title }
    author { Faker::Book.author }
    genre { Faker::Book.genre }
    editor { Faker::Book.publisher }
    description { Faker::Lorem.paragraph }
    isbn { Faker::IDNumber.valid }
    image { "image.png" }
    user_id { User.last }
  end
end