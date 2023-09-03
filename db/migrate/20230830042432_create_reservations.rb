class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.integer :rom_id
      t.integer :status 
      t.datetime :check_in_date
      t.datetime :check_out_date
      t.string :guest_name
      t.integer :guest_count
      
      t.integer :guest_id

      t.timestamps
    end
  end
end
