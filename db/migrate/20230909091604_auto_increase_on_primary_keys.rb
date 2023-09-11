class AutoIncreaseOnPrimaryKeys < ActiveRecord::Migration[7.0]
  
  def self.up
    sql = <<-SQL 
      CREATE SEQUENCE hotels_hotel_id_seq OWNED BY
    hotels.hotel_id INCREMENT BY 1 START WITH 1
      CREATE SEQUENCE rooms_room_id_seq OWNED BY
rooms.room_id INCREMENT BY 1 START WITH 1
      CREATE SEQUENCE guests_guest_id_seq OWNED BY
    guests.guest_id INCREMENT BY 1 START WITH 1
      CREATE SEQUENCE cancellations_cancellation_id_seq OWNED BY
    cancellations.cancellation_id INCREMENT BY 1 START WITH 1
      CREATE SEQUENCE reservations_reservation_id_seq OWNED BY
    reservations.reservation_id INCREMENT BY 1 START WITH 1

      ALTER TABLE hotels ALTER COLUMN hotel_id SET DEFAULT nextval('hotels_hotel_id_seq');
      ALTER TABLE rooms ALTER COLUMN room_id SET DEFAULT nextval('rooms_room_id_seq');
      ALTER TABLE guests ALTER COLUMN guest_id SET DEFAULT nextval('guests_guest_id_seq');
      ALTER TABLE cancellations ALTER COLUMN cancellation_id SET DEFAULT nextval('cancellations_cancellation_id_seq');
      ALTER TABLE reservations ALTER COLUMN reservation_id SET DEFAULT nextval('reservations_reservation_id_seq');
    SQL

    execute sql 
  end

  def self.down
    execute "DELETE SEQUENCE hotels_hotel_id_seq"
    execute "DELETE SEQUENCE rooms_room_id_seq"
    execute "DELETE SEQUENCE guests_guest_id_seq"
    execute "DELETE SEQUENCE cancellations_cancellation_id_seq"
    execute "DELETE SEQUENCE reservations_reservation_id_seq"
  end
end
