# == Schema Information
#
# Table name: reservations
#
#  id             :bigint           not null, primary key
#  check_in_date  :datetime
#  check_out_date :datetime
#  guest_count    :integer
#  guest_name     :string
#  status         :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  guest_id       :integer
#  rom_id         :integer
#
class Reservation < ApplicationRecord
  self.primary_key = 'reservation_id'

  belongs_to :hotel 
  belongs_to :room_type 
  belongs_to :guest, optional: true 

  enum status: { pending: 0, inputted_guest_info: 1, booked: 2, checkin: 3 ,cancelled: 4}

  validates :hotel_id, presence: true 
  validates :check_in_date, presence: true 
  validates :check_out_date, presence: true 
  validates :room_type_id, presence: true

  def inventories
    Inventory.available(check_in_date, check_out_date)
             .where(hotel_id: hotel_id, room_type_id: room_type_id)
  end 
end
