# == Schema Information
#
# Table name: hotels
#
#  address     :string
#  city        :string
#  contact     :string
#  country     :string
#  description :text
#  email       :string
#  latitude    :decimal(10, 6)
#  longitude   :decimal(10, 6)
#  name        :string
#  phone       :string
#  slug        :string
#  state       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  hotel_id    :bigint           primary key
#  user_id     :integer
#
class Hotel < ApplicationRecord
  self.primary_key = 'hotel_id'

  has_many :rooms
  has_many :room_types, class_name: 'RoomType'
  has_many :reservations, through: :rooms
  belongs_to :user 

  validates :name, presence: true
  validates :address, presence: true
  validates :user, presence: true
  
  resourcify

  before_save :set_slug 
  
  private 
  def set_slug 
    self.slug = name.parameterize
  end
end
