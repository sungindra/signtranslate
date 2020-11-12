# == Schema Information
#
# Table name: levels
#
#  id         :bigint           not null, primary key
#  answer     :string
#  hint       :string
#  level      :integer
#  video      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  season_id  :bigint
#
# Indexes
#
#  index_levels_on_season_id  (season_id)
#
# Foreign Keys
#
#  fk_rails_...  (season_id => seasons.id)
#
class Level < ApplicationRecord
  belongs_to :season

  mount_uploader :video, VideoUploader

  validates_presence_of :answer, :video, :season_id, :level
  validates_uniqueness_of :level, scope: [:season_id]
end
