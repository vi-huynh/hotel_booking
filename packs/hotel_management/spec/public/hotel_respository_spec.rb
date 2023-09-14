require 'rails_helper'

RSpec.describe HotelRepository, type: :service do
  describe '#call' do
    context 'when valid input' do 
      let(:user) { FactoryBot.create(:user) }
      let (:hotels) { FactoryBot.create_list(:hotel, 20, :with_room_type, user_id: user.id) }
      
      it '.all' do
        hotels
        expect(HotelRepository.all.to_a).to eq(hotels)
      end

      it '.find_by' do
        hotels
        result = HotelRepository.find_by(name: hotels.first.name)
        expect(result).to eq(hotels.first)
      end

      it '.find_id' do
        hotels
        result = HotelRepository.find_id(hotels.first.hotel_id)
        expect(result).to eq(hotels.first)
      end

      it '.by_slug' do
        hotels
        result = HotelRepository.by_slug(hotels.first.slug)
        expect(result).to eq(hotels.first)
      end
      
    end
  end
end
