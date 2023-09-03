# == Schema Information
#
# Table name: hotels
#
#  id                :bigint           not null, primary key
#  hotel_address     :string
#  hotel_contact     :string
#  hotel_description :text
#  hotel_email       :string
#  hotel_name        :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  user_id           :integer
#
require "test_helper"

class HotelTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end