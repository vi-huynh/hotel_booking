require 'rails_helper'

RSpec.describe	HotelCatalogsController,	type:	:controller	do
	describe "#index" do
    context	'default top of hotels' do
      let(:user) { FactoryBot.create(:user) }
      let(:hotels) { FactoryBot.create_list(:hotel, 20, user_id: user.id) }

      it 'responds with 200'	do
        hotels
        get	:index
        expect(response).to	have_http_status 200
      end

      it 'render template index'	do
        hotels
        get	:index
        expect(response).to render_template("index")
      end

      it 'assigns @hotel with page=1'	do
        hotels
        get	:index, params: { page: 0 }
        expect(assigns(:hotels)).to eq(hotels[0...10])
      end

      it 'assigns @hotel with page=2'	do
        hotels
        get	:index, params: { page: 2 }
        expect(assigns(:hotels)).to eq(hotels[10...20])
      end

      it 'assigns @hotel with page=3'	do
        hotels
        get	:index, params: { page: 3 }
        expect(assigns(:hotels)).to eq([])
      end
    end

    context	'default top of hotels' do
      it 'responds with 200'	do
        get	:index
        expect(response).to	have_http_status 200
      end

      it 'render template index'	do
        get	:index
        expect(response).to render_template("index")
      end
    end
  end 

  describe "#show" do
    let(:hotel) { FactoryBot.create(:hotel_with_rooms) }
    context	'when user visit /hotels/:slug' do
      it 'responds with 200'	do
        get	:show, params: { slug: 'abc' } 
        expect(response).to	have_http_status 200 
      end

      it 'assigns @hotel is nil'	do
        get	:show, params: { slug: 'abc' } 
        expect(assigns(:hotel)).to eq(nil)
      end
    end

    context	'when user visit /hotels/:slug' do
      let(:hotel) { 
        user = FactoryBot.create(:user)
        FactoryBot.create(:hotel, user_id: user.id) 
      }
      
      it 'responds with 200'	do
        get	:show, params: { slug: hotel.slug } 
        expect(response).to	have_http_status	200 
      end

      it 'assigns @hotel'	do
        get	:show, params: { slug: hotel.slug } 
        expect(assigns(:hotel)).to eq(hotel)
      end
    end
  end
end 