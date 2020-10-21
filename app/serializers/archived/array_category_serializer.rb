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
class ArrayCategorySerializer < ActiveModel::Serializer
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
