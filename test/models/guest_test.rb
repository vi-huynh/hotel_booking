# == Schema Information
#
# Table name: guests
#
#  id                 :bigint           not null, primary key
#  guest_address      :string
#  guest_email        :string
#  guest_name         :string
#  guest_phone_number :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
require "test_helper"

class GuestTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
