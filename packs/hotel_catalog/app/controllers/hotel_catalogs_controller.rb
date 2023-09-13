class HotelCatalogsController < ApplicationController
  before_action :set_hotel, only: [:show]

  def index
    @search_form = SearchHotelForm.new(name: params[:name]) 
    actor = HotelManagement::SearchHotel.result(name: @search_form.name)
    @hotels = actor.hotels.presence || HotelRepository.all.limit(3)
  end

  def show 
    @search_form = SearchRoomForm.new(
      check_in_date: params[:check_in_date], 
      check_out_date: params[:check_out_date],
      hotel: @hotel 
    )
    actor = ::HotelCatalogs::Search.call(search_form: @search_form)
    @room_types = actor.room_types 
  end 

  private 

  def set_hotel
    @hotel = HotelRepository.find_by(slug: params[:slug])
  end 
end