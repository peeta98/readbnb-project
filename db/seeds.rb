# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'uri'
require 'net/http'

puts "Deleting previous seeds..."
User.destroy_all
Book.destroy_all
UserBook.destroy_all
Review.destroy_all
puts "Previous seeds deleted!"

url = URI("https://book-finder1.p.rapidapi.com/api/search")

http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true

request = Net::HTTP::Get.new(url)
request["X-RapidAPI-Key"] = 'a5ec1d093cmshf3922a4cee2183fp1a6fa3jsnd3c0f77f2433'
request["X-RapidAPI-Host"] = 'book-finder1.p.rapidapi.com'

response = http.request(request)
book_api = JSON.parse(response.read_body) # Transform String to an array of hashes

# ----- Seeding instances of User -----
puts "Creating 1 user"
User.create!(
  username: "Peeta98",
  email: "pedro@gmail.com",
  password: "secret",
  gender: "Male",
  age: 25
)
puts "User created!"

# ----- Seeding Book instances -----
puts "Creating books..."
book_api["results"].each do |book|
  Book.create!(
    name: book["title"],
    author: book["authors"][0],
    genre: %w[Action Drama Comedy Terror Fiction Romance].sample,
    photo_url: book["published_works"][0]["cover_art_url"],
    price: (8..25).to_a.sample,
    publication_date: Time.at(rand * Time.now.to_i)
  )
end
puts "All books created!"
