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
  self.primary_key = 'room_id'
  belongs_to :hotel
  belongs_to :room_type
  has_many :reservations
  
  validates :rom_number, presence: true, uniqueness: { scope: :hotel_id, case_sensitive: true, message: "is already taken" }
  validates :room_type, presence: true 
  validates :hotel, presence: true 

  before_save :set_avaliable 

  private 

  def set_avaliable
    self.is_available ||= true 
  end 
end
