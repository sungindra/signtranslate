class InjectSignData < ActiveRecord::Migration[5.2]
  def change
    User.create(email: "admin@example.com", password: "password")

    ("a".."z").each do |x| 
      Sign.create(meaning: x, sign_type: "sibi", image: "/signs/sibi_"+x+".png")
    end
    ("a".."z").each do |x| 
      Sign.create(meaning: x, sign_type: "bisindo", image: "/signs/bisindo_"+x+".png")
    end
  end
end
