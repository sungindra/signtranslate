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
  has_many :level
end
