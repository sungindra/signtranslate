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
class CategorySerializer < ActiveModel::Serializer
  # attributes :id, :title, :image
  # has_many :sibi, serializer: SignDetailSerializer
  # has_many :bisindo, serializer: SignDetailSerializer

  # def sibi
  #   object.signs.sibi
  # end

  # def bisindo
  #   object.signs.bisindo
  # end

  attributes :category, :sibiTitle, :sibiImage, :bisindoTitle, :bisindoImage

  def category
    object.title
  end

  def sibiTitle
    object.signs.sibi.pluck(:meaning)
  end

  def sibiImage
    object.signs.sibi.pluck(:image)
  end

  def bisindoTitle
    object.signs.bisindo.pluck(:meaning)
  end

  def bisindoImage
    object.signs.bisindo.pluck(:image)
  end
end
