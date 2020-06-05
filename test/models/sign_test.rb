# == Schema Information
#
# Table name: signs
#
#  id          :bigint           not null, primary key
#  image       :string
#  meaning     :string
#  sign_type   :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :bigint
#
# Indexes
#
#  index_signs_on_category_id  (category_id)
#
# Foreign Keys
#
#  fk_rails_...  (category_id => categories.id)
#
require 'test_helper'

class SignTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end