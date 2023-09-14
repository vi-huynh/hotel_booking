#
FactoryBot.define do
  factory :room do
    sequence(:rom_number) { |n| (99 + n).to_s } 
    bed_count { (1..4).to_a.sample }
    is_available { true }
    max_adults_allowed { (1..4).to_a.sample }
    max_children_allowed { (1..4).to_a.sample }
    room_description { Faker::Lorem.paragraph }
    room_max_occupancy { (1..4).to_a.sample }
  end
end