# == Schema Information
#
# Table name: payments
#
#  id             :bigint           not null, primary key
#  amount         :decimal(, )
#  payment_at     :datetime
#  payment_method :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  reservation_id :integer
#
require "test_helper"

class PaymentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
