# == Schema Information
#
# Table name: inventories
#
#  id              :bigint           not null, primary key
#  date            :date
#  total_inventory :integer
#  total_reserved  :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  hotel_id        :bigint
#  room_type_id    :bigint
#
# Indexes
#
#  index_inventories_on_hotel_id_and_room_type_id_and_date  (hotel_id,room_type_id,date) UNIQUE
#
FactoryBot.define do
  factory :inventory do
    hotel_id { "" }
    room_type_id { "" }
    date { "2023-09-09 14:55:03" }
    total_inventory { 1 }
    total_reserved { 1 }
  end
end
