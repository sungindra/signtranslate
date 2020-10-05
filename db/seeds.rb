# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(email: "admin@example.com", password: "password", name: "Admin")

Category.create(title: "Default")
alphabet = Category.create(title: "Abjad")
number = Category.create(title: "Angka")

("a".."z").each do |x| 
  Sign.create(meaning: x, sign_type: "sibi", image: "sibi_"+x+".png", category: alphabet, user_id: 1)
end
("a".."z").each do |x| 
  Sign.create(meaning: x, sign_type: "bisindo", image: "bisindo_"+x+".png", category: alphabet, user_id: 1)
end

#this is done to match data in server before addition of carrierwave
Sign.create(category: alphabet, user_id: 1)
Sign.last.destroy

10.times { |x| Sign.create!(meaning: (x+1).to_s, sign_type: "sibi", image: "sibi_"+(x+1).to_s+".png", category: number, user_id: 1) }
10.times { |x| Sign.create!(meaning: (x+1).to_s, sign_type: "bisindo", image: "bisindo_"+(x+1).to_s+".png", category: number, user_id: 1) }
