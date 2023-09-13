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
