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
  attributes :id, :title, :image
  has_many :sibi, serializer: SignDetailSerializer
  has_many :bisindo, serializer: SignDetailSerializer

  def sibi
    object.signs.sibi
  end

  def bisindo
    object.signs.bisindo
  end
end
