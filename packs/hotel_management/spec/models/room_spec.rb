require 'rails_helper'

RSpec.describe Room, :type => :model do
  context  'valid' do 
    let(:user) { FactoryBot.create(:user) }
    let(:hotel) { FactoryBot.create(:hotel, :with_room_type, user_id: user.id) }
    it 'valid rom_number, hotel_id, room_type_id' do
      room = Room.new(
        rom_number: '555', 
        hotel_id: hotel.id,
        room_type_id: hotel.room_types.first.id, 

      )
      expect(hotel).to be_valid
    end
  end

  context  'invalid' do 
    let(:user) { FactoryBot.create(:user) }
    let(:hotel) { FactoryBot.create(:hotel, :with_room_type, user_id: user.id) }
    it 'rom_number is blank' do
      room = Room.new(
        rom_number: '', 
        hotel_id: hotel.id,
        room_type_id: hotel.room_types.first.id, 

      )
      expect(room).to be_invalid
    end

    it 'rom_number is duplicate' do
      room = Room.new(
        rom_number: hotel.rooms.first.rom_number, 
        hotel_id: hotel.id,
        room_type_id: hotel.room_types.first.id, 

      )
      expect(room).to be_invalid
    end
  end


end
