# == Schema Information
#
# Table name: rooms
#
#  id               :bigint           not null, primary key
#  avaliable_at     :datetime
#  bathroom_count   :integer
#  bed_count        :integer
#  rom_number       :integer
#  room_description :text
#  room_name        :string
#  room_price       :decimal(, )
#  room_type        :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  hotel_id         :bigint
#
# Indexes
#
#  index_rooms_on_hotel_id  (hotel_id)
#
require "test_helper"

class RoomTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
