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
FactoryBot.define do
  factory :room_type do
    name { "MyString" }
    price { "9.99" }
    hotel_id { "" }
  end
end
