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
  belongs_to :hotel, class_name: 'Hotel'
  has_many :inventories 
  has_many :rooms
  validates :name, presence: true, uniqueness: { scope: :hotel_id}
  validates :price, presence: true

  def min_inventory(from_date, to_date)
    inventories.where('date between ? AND ?', from_date, to_date).minimum('total_inventory - total_reserved')
  end
end
