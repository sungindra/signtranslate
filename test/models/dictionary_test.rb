# == Schema Information
#
# Table name: dictionaries
#
#  id         :bigint           not null, primary key
#  image      :string
#  meaning    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  season_id  :bigint
#
# Indexes
#
#  index_dictionaries_on_season_id  (season_id)
#
# Foreign Keys
#
#  fk_rails_...  (season_id => seasons.id)
#
require 'test_helper'

class DictionaryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
