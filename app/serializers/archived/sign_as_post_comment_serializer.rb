class SignAsPostCommentSerializer < ActiveModel::Serializer
  attributes :id, :meaning, :sign_type, :user_name, :user_id, :total_votes, :current_user_vote
  has_many :comment_replies, serializer: CommentReplySerializer, include_nested_associations: true
  has_one :current_user_vote, serializer: VoteSerializer

  def user_name
    object.user.name
  end

  def user_id
    object.user.id
  end

  def total_votes
    object.votes.total_votes
  end

  def current_user_vote
    object.votes.where(user: scope.current_user).first
  end
end