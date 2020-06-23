# == Schema Information
#
# Table name: votes
#
#  id            :bigint           not null, primary key
#  up            :boolean
#  voteable_type :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  voteable_id   :bigint
#
# Indexes
#
#  index_votes_on_voteable_type_and_voteable_id  (voteable_type,voteable_id)
#
class Vote < ApplicationRecord
  belongs_to :voteable, polymorphic: true
end