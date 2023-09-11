class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations, id: false, primary_key: :reservation_id do |t|
      t.bigint :reservation_id
      t.bigint :hotel_id, references: :hotels
      t.integer :room_type_id
      t.bigint :guest_id

      t.datetime :check_in_date
      t.datetime :check_out_date

      t.integer :status 
      t.timestamps
    end
  end
end
