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
require 'rails_helper'

RSpec.describe RoomType, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
