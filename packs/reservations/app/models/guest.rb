# == Schema Information
#
# Table name: guests
#
#  age        :integer
#  email      :string
#  first_name :string
#  last_name  :string
#  phone      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  guest_id   :bigint           primary key
#
class Guest < ApplicationRecord
  self.primary_key = 'guest_id'
  has_many :reservations
end
