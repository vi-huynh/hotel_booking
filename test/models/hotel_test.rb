# == Schema Information
#
# Table name: hotels
#
#  address     :string
#  city        :string
#  contact     :string
#  country     :string
#  description :text
#  email       :string
#  latitude    :decimal(10, 6)
#  longitude   :decimal(10, 6)
#  name        :string
#  phone       :string
#  slug        :string
#  state       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  hotel_id    :bigint           primary key
#  user_id     :integer
#
require "test_helper"

class HotelTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
