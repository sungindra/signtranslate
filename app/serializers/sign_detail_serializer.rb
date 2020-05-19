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
class SignDetailSerializer < ActiveModel::Serializer
  attributes :id, :meaning, :sign_type, :image
end
