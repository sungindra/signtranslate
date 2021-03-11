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
class LevelSerializer < ActiveModel::Serializer
  attributes :id, :level, :level_string, :answer, :hint, :video

  def level_string
    "Level #{object.season.tag} - #{object.level.to_s}"
  end

  def video
    object.video
  end
end
