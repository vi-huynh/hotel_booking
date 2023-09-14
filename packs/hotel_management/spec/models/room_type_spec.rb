require 'rails_helper'

RSpec.describe RoomType, :type => :model do
  context  'valid' do 
    let(:user) { FactoryBot.create(:user) }
    let(:hotel) { FactoryBot.create(:hotel, :with_room_type, user_id: user.id) }
    
    it 'name, price is valid' do
      room_type = RoomType.new(
        name: Faker::Name.name,
        hotel: hotel, 
        price: 10 
      )
      expect(room_type).to be_valid
    end
  end

  context  'invalid' do 
    let(:user) { FactoryBot.create(:user) }
    let(:hotel) { FactoryBot.create(:hotel, :with_room_type, user_id: user.id) }
    
    it 'name is blank' do
      room_type = RoomType.new(
        name: '',
        hotel: hotel, 
        price: 10 
      )
      expect(room_type).to be_invalid
    end

    it 'price is blank' do
      room_type = RoomType.new(
        name: Faker::Name.name,
        hotel: hotel, 
        price: nil
      )
      expect(room_type).to be_invalid
    end

    it 'price is negative' do
      room_type = RoomType.new(
        name: Faker::Name.name,
        hotel: hotel, 
        price: -1
      )
      expect(room_type).to be_invalid
    end

    it 'price is zero' do
      room_type = RoomType.new(
        name: Faker::Name.name,
        hotel: hotel, 
        price: 0
      )
      expect(room_type).to be_invalid
    end
  end
end