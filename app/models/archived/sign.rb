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
class Sign < ApplicationRecord
  include AASM

  aasm column: "status" do
    state :new, :waiting_approval, :approved, :inactive

    initial_state :new

    event :user_submitted do
      transitions from: :new, to: :waiting_approval
    end

    event :admin_submitted do
      transitions from: :new, to: :approved
    end

    event :approve do
      transitions from: :waiting_approval, to: :approved
    end

    event :inactivate do
      transitions from: :approved, to: :inactive
    end

    event :reactivate do
      transitions from: :inactive, to: :approved
    end
  end

  enum sign_type: { sibi: 0 , bisindo: 1 }

  belongs_to :category
  belongs_to :user
  belongs_to :post, optional: true

  has_many :comment_replies
  has_many :votes, as: :voteable

  mount_uploader :image, ImageUploader
end
