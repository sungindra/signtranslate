# == Schema Information
#
# Table name: dictionaries
#
#  id         :bigint           not null, primary key
#  image      :string
#  meaning    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  season_id  :bigint
#
# Indexes
#
#  index_dictionaries_on_season_id  (season_id)
#
# Foreign Keys
#
#  fk_rails_...  (season_id => seasons.id)
#
class Dictionary < ApplicationRecord
  belongs_to :season
  mount_uploader :image, ImageUploader

  validates_presence_of :image, :meaning, :season_id
end
