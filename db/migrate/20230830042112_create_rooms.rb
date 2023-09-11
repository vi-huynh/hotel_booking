class CreateRooms < ActiveRecord::Migration[7.0]
  def change
    create_table :rooms, id: false, primary_key: :room_id do |t|
      t.bigint :room_id
      t.bigint :room_type_id
      t.bigint :hotel_id, references: :hotels
      t.boolean :is_available, default: true 

      t.string :rom_number
      t.decimal :room_price
      t.integer :bed_count 
      t.integer :room_max_occupancy
      t.integer :max_adults_allowed
      t.integer :max_children_allowed
      t.text :room_description
      t.timestamps
    end
  end
end
