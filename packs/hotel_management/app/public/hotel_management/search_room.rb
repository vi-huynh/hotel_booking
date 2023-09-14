module HotelManagement
  class SearchRoom < ApplicationService
    fail_on ServiceActor::ArgumentError

    input :check_in_date, type: Date
    input :check_out_date, type: Date
    input :hotel, type: Hotel

    output :room_types
    
    def call 
      valid?
      room_types = hotel.room_types
      room_types.each do |room_type| 
        room_type.available = 
          InventoryRepository.min_inventory(
          room_type_id: room_type.id, 
          from_date: check_in_date, 
          to_date: check_out_date
        )
      end
      self.room_types = room_types.select {|x | x.available.to_i > 0}
    end 

    private 
    def valid? 
      if check_in_date >= check_out_date 
        fail!(error: "Check in date must be before check out date")
      end 
    end 
  end
end
