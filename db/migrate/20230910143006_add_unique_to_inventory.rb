class AddUniqueToInventory < ActiveRecord::Migration[7.0]
  def change
    add_index :inventories, [:hotel_id, :room_type_id, :date], unique: true 
  end
end
