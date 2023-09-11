# == Schema Information
#
# Table name: hotels
#
#  id                :bigint           not null, primary key
#  hotel_address     :string
#  hotel_contact     :string
#  hotel_description :text
#  hotel_email       :string
#  hotel_name        :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  user_id           :integer
#
class Hotel < ApplicationRecord
  self.primary_key = 'hotel_id'

  has_many :rooms
  has_many :room_types 
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
