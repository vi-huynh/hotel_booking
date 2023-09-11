class AddNumberRoomToReservation < ActiveRecord::Migration[7.0]
  def change
    add_column :reservations, :number_room, :integer
  end
end
