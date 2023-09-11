module Reservations
  class Booking < ApplicationService
    input :reservation
    output :reservation 

    def call 
      # fail!(error: 'Room is not available') if invalid_stock?
      # fail!(error: 'The reservation is invalid') unless valid?

      ActiveRecord::Base.transaction do 
        update_inventory
        update_status_to_reserved
        generate_booking_number
        send_booking_info_to_guest
      end 

      self.reservation = reservation
      self
    end 

    private 

    def invalid_stock? 
      reservation.inventories.any? {|x| x.total_inventory - x.total_reserved < 0 }
    end 

    def valid?
      reservation.guest.present? 
    end

    def update_inventory
      reservation.inventories.lock.each do |inventory|
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