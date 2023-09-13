# == Schema Information
#
# Table name: cancellations
#
#  id           :bigint           not null, primary key
#  cancelled_at :datetime
#  reason       :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Cancellation < ApplicationRecord
  self.primary_key = 'cancellation_id'

  belongs_to :reservation
end
