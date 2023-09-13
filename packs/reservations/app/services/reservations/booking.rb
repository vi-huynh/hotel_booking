module Reservations
  class Booking < ApplicationService
    input :reservation
    output :reservation 

    def call 
      # fail!(error: 'The reservation is invalid') unless valid?
      inventories = InventoryRepository.available_for(
        check_in_date: reservation.check_in_date,
        check_out_date: reservation.check_out_date,
        hotel_id: reservation.hotel_id,
        room_type_id: reservation.room_type_id
      )
      fail!(error: 'Room is not available') if invalid_stock?(inventories)

      ActiveRecord::Base.transaction do 
        update_inventory(inventories)
        update_status_to_reserved
        generate_booking_number
        send_booking_info_to_guest
      end 

      self.reservation = reservation
      self
    end 

    private 

    def invalid_stock?(inventories)
      inventories.any? {|x| x.total_inventory - x.total_reserved < 0 }
    end 

    def valid_guest?
      reservation.guest.present? 
    end

    def update_inventory(inventories)
      inventories.lock.each do |inventory|
        inventory.update(total_reserved:  inventory.total_reserved + reservation.number_room)
      end
    end

    def send_booking_info_to_guest 
      
    end 

    def generate_booking_number
      while true 
        booking_number = 6.times.map { [*'0'..'9', *'a'..'z'].sample }.join.upcase

        unless Reservation.exists?(booking_number: booking_number)
          reservation.booking_number = booking_number
          reservation.save!
          break
        end 
      end
    end

    def update_status_to_reserved
      reservation.booked!
    end 
  end 
end 