# == Schema Information
#
# Table name: votes
#
#  id            :bigint           not null, primary key
#  vote          :integer
#  voteable_type :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  user_id       :bigint
#  voteable_id   :bigint
#
# Indexes
#
#  index_votes_on_user_id                        (user_id)
#  index_votes_on_voteable_type_and_voteable_id  (voteable_type,voteable_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#

class VoteSerializer < ActiveModel::Serializer
  attributes :vote
end
