class AddBookingNumberToReservation < ActiveRecord::Migration[7.0]
  def change
    add_column :reservations, :booking_number, :string, unique: true 
  end
end
