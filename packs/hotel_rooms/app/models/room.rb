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
class Room < ApplicationRecord
  enum :room_type, { single: 0, double: 1, suite: 2 }, prefix: true, scopes: false

  has_many :reservations
  belongs_to :hotel

  validates :rom_number, presence: true, uniqueness: { scope: :hotel_id, case_sensitive: true, message: "is already taken" }
end
