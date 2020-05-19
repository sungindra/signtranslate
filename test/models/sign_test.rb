# == Schema Information
#
# Table name: signs
#
#  id         :bigint           not null, primary key
#  image      :string
#  meaning    :string
#  sign_type  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'test_helper'

class SignTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
