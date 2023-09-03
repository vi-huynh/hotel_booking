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
  has_many :rooms
  has_many :reservations, through: :rooms
  belongs_to :user 

  validates :hotel_name, presence: true
  validates :hotel_address, presence: true
  validates :user, presence: true
  

end
