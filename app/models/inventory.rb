# == Schema Information
#
# Table name: inventories
#
#  id              :bigint           not null, primary key
#  date            :date
#  total_inventory :integer
#  total_reserved  :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  hotel_id        :bigint
#  room_type_id    :bigint
#
# Indexes
#
#  index_inventories_on_hotel_id_and_room_type_id_and_date  (hotel_id,room_type_id,date) UNIQUE
#
class Inventory < ApplicationRecord
  belongs_to :hotel
  belongs_to :room_type 

  validates :hotel, presence: true 
  validates :room_type, presence: true 
  validates :date, presence: true 

  scope :available, -> (from_date, to_date) { where('date >= ? AND date <= ?', from_date, to_date)}
end
