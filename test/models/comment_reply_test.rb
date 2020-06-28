# == Schema Information
#
# Table name: comment_replies
#
#  id         :bigint           not null, primary key
#  comment    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  sign_id    :bigint
#  user_id    :bigint
#
# Indexes
#
#  index_comment_replies_on_sign_id  (sign_id)
#  index_comment_replies_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (sign_id => signs.id)
#  fk_rails_...  (user_id => users.id)
#
require 'test_helper'

class CommentReplyTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
