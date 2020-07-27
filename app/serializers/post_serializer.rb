# == Schema Information
#
# Table name: posts
#
#  id          :bigint           not null, primary key
#  content     :string
#  status      :integer
#  title       :string
#  type        :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :bigint
#  user_id     :bigint
#
# Indexes
#
#  index_posts_on_category_id  (category_id)
#  index_posts_on_user_id      (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (category_id => categories.id)
#  fk_rails_...  (user_id => users.id)
#

class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :user_name, :status, :total_votes, :current_user_vote
  has_one :current_user_vote, serializer: VoteSerializer

  def user_name
    object.user.name
  end

  def total_votes
    object.votes.total_votes
  end

  def current_user_vote
    object.votes.where(user: scope.current_user).first
  end
end
