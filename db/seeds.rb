# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# User.create(email: "admin@example.com", password: "password", name: "Admin")

season = Season.first

("a".."z").each do |x| 
  Dictionary.create(meaning: x, image: "sibi_"+x+".png", season: season)
end

10.times { |x| Dictionary.create!(meaning: (x+1).to_s, image: "sibi_"+(x+1).to_s+".png", season: season) }
