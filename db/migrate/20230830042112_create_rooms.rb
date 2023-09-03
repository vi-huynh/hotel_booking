class CreateRooms < ActiveRecord::Migration[7.0]
  def change
    create_table :rooms do |t|
      t.string :room_name
      t.integer :rom_number
      t.integer :room_type
      t.decimal :room_price
      t.references :hotel
      t.integer :bed_count 
      t.integer :bathroom_count
      t.text :room_description
      t.datetime :avaliable_at 
      t.timestamps
    end
  end
end
