# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  name                   :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :signs, dependent: :nullify
  has_many :comments, dependent: :nullify
  has_many :votes, dependent: :destroy

  # def clear_push_notification!
  #   update(push_token: nil)
  # end

  def generate_jwt
    JWT.encode({
      id: id,
      exp: 5.years.from_now.to_i,
      iat: Time.zone.now.to_i
      }, "secret") #temporary
  end

  def self.authenticate(email, password)
    user = User.find_by(email: email)
    return nil unless user.present?
    user if user.valid_password?(password)
  end
end
