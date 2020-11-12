# == Schema Information
#
# Table name: seasons
#
#  id         :bigint           not null, primary key
#  tag        :string
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Season < ApplicationRecord
  has_many :levels
  has_many :dictionaries

  validates_presence_of :tag, :title
  validates_uniqueness_of :tag, :title
end
