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
    name { %w[Single Double].sample }
    price { Faker::Commerce.price }
    trait :with_room do 
      after(:create) do |room_type|
        FactoryBot.create(:room, hotel_id: room_type.hotel_id, room_type: room_type)
      end 
    end 
  end
end
