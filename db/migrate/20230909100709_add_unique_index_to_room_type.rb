class AddUniqueIndexToRoomType < ActiveRecord::Migration[7.0]
  def change
    add_index :room_types, [:name, :hotel_id], unique: true
  end
end
