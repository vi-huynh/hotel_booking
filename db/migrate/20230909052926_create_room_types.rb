class CreateRoomTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :room_types do |t|
      t.string :name
      t.decimal :price
      t.bigint :hotel_id, references: :hotels

      t.timestamps
    end
  end
end
