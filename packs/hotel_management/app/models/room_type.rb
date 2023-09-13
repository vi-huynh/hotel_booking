# == Schema Information
#
# Table name: room_types
#
#  id         :bigint           not null, primary key
#  name       :string
#  price      :decimal(, )
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  hotel_id   :bigint
#
class RoomType < ApplicationRecord
  attr_accessor :available

  belongs_to :hotel, class_name: Hotel.to_s 
  has_many :rooms
  validates :name, presence: true, uniqueness: { scope: :hotel_id}
  validates :price, presence: true
end
