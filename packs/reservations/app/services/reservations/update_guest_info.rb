module Reservations
  class UpdateGuestInfo < ApplicationService
    input :reservation, type: Reservation
    input :guest_email
    input :guest_first_name
    input :guest_last_name
    input :guest_phone, allow_nil: true 
    input :guest_age, allow_nil: true 

    output :reservation 

    def call 
      ActiveRecord::Base.transaction do
        guest = create_or_update_guest 
        assign_guest_to_reservation(guest)
        update_status_to_reserved
      end 

      self.reservation = reservation
    end 

    private 

    def create_or_update_guest 
      guest = Guest.find_or_initialize_by(email: guest_email)
      guest.update!(
        first_name: guest_first_name, 
        last_name: guest_last_name,
        phone: guest_phone, 
        age: guest_age
      )
      guest
    end 

    def assign_guest_to_reservation(guest)
      reservation.guest = guest
      reservation.save! 
    end 

    def update_status_to_reserved
      reservation.inputted_guest_info!
    end 
  end 
end 