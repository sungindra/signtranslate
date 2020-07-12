# == Schema Information
#
# Table name: posts
#
#  id         :bigint           not null, primary key
#  content    :string
#  status     :integer
#  title      :string
#  type       :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint
#
# Indexes
#
#  index_posts_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#

class PostDetailSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :status, :total_votes
  has_many :signs, serializer: SignSerializer
  has_one :user_vote, serializer: VoteSerializer

  def total_votes
    object.votes.total_votes
  end

  def user_vote
    object.votes.where(user: scope.current_user).first
  end
end
