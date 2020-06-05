# == Schema Information
#
# Table name: categories
#
#  id         :bigint           not null, primary key
#  image      :string
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Category < ApplicationRecord
  validates_uniqueness_of :image

  has_many :signs
end
