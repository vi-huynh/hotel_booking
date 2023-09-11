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
require "test_helper"

class GuestTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
