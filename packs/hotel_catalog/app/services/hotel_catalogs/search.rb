module HotelCatalogs
  class Search < ApplicationService
    input :search_form, type: SearchRoomForm
    output :room_types 
    
    def call 
      hotel = search_form.hotel 
      room_types = hotel.room_types
      room_types.each do |room_type| 
        room_type.available = InventoryRepository.min_inventory(
          room_type_id: room_type.id, 
          from_date: search_form.check_in_date, 
          to_date: search_form.check_out_date
        )
      end 

      self.room_types = room_types
    end 
  end
end
