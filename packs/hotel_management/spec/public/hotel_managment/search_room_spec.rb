require 'rails_helper'

RSpec.describe HotelManagement::SearchRoom, type: :service do
  describe '#call' do
    context 'when valid input' do 
      let(:user) { FactoryBot.create(:user) }
      let(:hotel) { FactoryBot.create(:hotel, :with_room_type, user_id: user.id) }
      let(:inventories) { 
        RoomType.find_each do |room_type|
          today = DateTime.now
          (0...7).to_a.each  do |i|
            Inventory.create(
              date:  today + i.days,
              total_inventory: room_type.rooms.count,
              total_reserved: 0, 
              hotel_id: room_type.hotel_id, 
              room_type_id: room_type.id
            )
          end
        end
      }
      it 'return room available' do
        hotel
        inventories
        actor = HotelManagement::SearchRoom.result(
          hotel: hotel,
          check_in_date: Date.today,
          check_out_date: Date.today + 1
        )
        expect(actor.room_types.to_a).to eq(hotel.room_types.to_a)
      end

      it "return empty" do 
        hotel
        inventories
        actor = HotelManagement::SearchRoom.result(
          hotel: hotel,
          check_in_date: Date.today + 10,
          check_out_date: Date.today + 11
        )
        expect(actor.room_types.to_a).to eq([])
      end
    end
  end
end
