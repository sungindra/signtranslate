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
class Vote < ApplicationRecord
  belongs_to :voteable, polymorphic: true
  belongs_to :user
  validates_presence_of :vote

  enum vote: {down: 0, up: 1}

  def self.total_votes
    up.count - down.count
  end
end
