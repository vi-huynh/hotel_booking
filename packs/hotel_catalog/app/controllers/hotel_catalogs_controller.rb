class HotelCatalogsController < ApplicationController
  before_action :set_hotel, only: [:show]

  def index
    @hotels = Hotel.all 
  end

  def show 
    @search_form = SearchForm.new(
      check_in_date: params[:check_in_date], 
      check_out_date: params[:check_out_date],
      hotel: @hotel 

    )
    actor = ::HotelCatalogs::Search.call(search_form: @search_form)
    @room_types = actor.room_types 

  end 

  private 

  

  def set_hotel
    @hotel = Hotel.find_by(slug: params[:slug])
  end 
end