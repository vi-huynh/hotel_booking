require 'rails_helper'

RSpec.describe HotelManagement::SearchHotel, type: :service do
  describe '#call' do
    context 'when search name with page = 0' do 
      let(:user) { FactoryBot.create(:user) }
      let (:hotels) { FactoryBot.create_list(:hotel, 20, :with_room_type, user_id: user.id) }
      
      it 'return hotel math name' do
        hotel = hotels.sample
        actor = HotelManagement::SearchHotel.result(name: hotel.name, page: 0)
        expect(actor.hotels.to_a).to eq([hotel])
      end

      it "return empty" do 
        hotels
        actor = HotelManagement::SearchHotel.result(name: 'not_exist', page: 0)
        expect(actor.hotels.to_a).to eq([])
      end

      it "return default listing hotels" do 
        hotels
        actor = HotelManagement::SearchHotel.result(name: '', page: 0)
        expect(actor.hotels.to_a).to eq(hotels[0...10])
      end
      
    end
  end
end