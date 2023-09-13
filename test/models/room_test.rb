# == Schema Information
#
# Table name: rooms
#
#  bed_count            :integer
#  is_available         :boolean
#  max_adults_allowed   :integer
#  max_children_allowed :integer
#  rom_number           :string
#  room_description     :text
#  room_max_occupancy   :integer
#  room_price           :decimal(, )
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  hotel_id             :bigint
#  room_id              :bigint           primary key
#  room_type_id         :bigint
#
require "test_helper"

class RoomTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
