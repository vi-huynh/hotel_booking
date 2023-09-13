class SearchBooking < ApplicationService
  input  :search_form, type: SearchBookingForm 
  output :reservation

  def call 
    guest = Guest.find_by(email: search_form.guest_email)

    fail!(error: 'Cannot find booking with email') if guest.blank? 

    self.reservation = Reservation.where(
      booking_number: search_form.booking_number,
      guest_id: guest.id
    ).first 
  end 
end