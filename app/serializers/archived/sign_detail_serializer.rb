# == Schema Information
#
# Table name: signs
#
#  id          :bigint           not null, primary key
#  description :string
#  image       :string
#  meaning     :string
#  sign_type   :integer
#  status      :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :bigint
#  post_id     :bigint
#  user_id     :bigint
#
# Indexes
#
#  index_signs_on_category_id  (category_id)
#  index_signs_on_post_id      (post_id)
#  index_signs_on_user_id      (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (category_id => categories.id)
#  fk_rails_...  (post_id => posts.id)
#  fk_rails_...  (user_id => users.id)
#
class SignDetailSerializer < ActiveModel::Serializer
  attributes :id, :meaning, :sign_type, :image, :description, :user_id, :user_name

  def image
    object.image.url
  end

  def user_name
    object.user.name
  end
end
