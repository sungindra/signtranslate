# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(email: "admin@example.com", password: "password", name: "Admin")

alphabet = Category.create(title: "Abjad", image: "/alphabet.png")
number = Category.create(title: "Angka", image: "/number.png")

("a".."z").each do |x| 
  Sign.create(meaning: x, sign_type: "sibi", image: "sibi_"+x+".png", category: alphabet, user_id: 1)
end
("a".."z").each do |x| 
  Sign.create(meaning: x, sign_type: "bisindo", image: "bisindo_"+x+".png", category: alphabet, user_id: 1)
end

10.times { |x| Sign.create!(meaning: (x+1).to_s, sign_type: "bisindo", image: "bisindo_"+(x+1).to_s+".png", category: number, user_id: 1) }
10.times { |x| Sign.create!(meaning: (x+1).to_s, sign_type: "sibi", image: "sibi_"+(x+1).to_s+".png", category: number, user_id: 1) }
