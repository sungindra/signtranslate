# == Schema Information
#
# Table name: signs
#
#  id          :bigint           not null, primary key
#  description :string
#  image       :string
#  meaning     :string
#  sign_type   :integer
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
require 'test_helper'

class SignTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
