class HotelCatalogsController < ApplicationController
  before_action :set_hotel, only: [:show]

  def index
    @search_form = SearchHotelForm.new(name: params[:name]) 
    actor = HotelManagement::SearchHotel.result(name: @search_form.name, page: params[:page])
    @hotels = actor.hotels.presence || []
  end

  def show 
    @search_form = SearchRoomForm.new(
      check_in_date: params[:check_in_date], 
      check_out_date: params[:check_out_date],
      hotel: @hotel 
    )
    actor = HotelManagement::SearchRoom.result(@search_form.to_h)
    if actor.success?
      @room_types = actor.room_types 
    else
      @room_types = []
      @errors = actor.error
    end

  end 

  private 

  def set_hotel
    @hotel = HotelRepository.find_by(slug: params[:slug])
  end 
end