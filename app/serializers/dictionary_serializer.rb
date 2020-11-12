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
class DictionarySerializer < ActiveModel::Serializer
  attributes :id, :category_id, :category_name, :meaning, :image

  def category_id
    object.season.id
  end

  def category_name
    object.season.title
  end

  def image
    object.image.url
  end
end
