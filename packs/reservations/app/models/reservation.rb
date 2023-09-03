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
  has_one :room
  has_one :guest
  enum status: { pending: 0, confirmed: 1, cancelled: 2 }
end
