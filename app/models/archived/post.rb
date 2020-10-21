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
class Post < ApplicationRecord
  belongs_to :user
  has_many :signs, dependent: :nullify
  has_many :votes, as: :voteable

  enum status: {unapproved: 0, approved: 1}
  # enum type: { sibi: 0 , bisindo: 1 }
end
