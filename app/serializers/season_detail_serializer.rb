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
class SeasonDetailSerializer < ActiveModel::Serializer
  attributes :id, :tag, :title
  has_many :levels, serializer: LevelSerializer

  def levels
    object.levels
  end
end
