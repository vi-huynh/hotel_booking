class CreateInventories < ActiveRecord::Migration[7.0]
  def change
    create_table :inventories do |t|
      t.bigint :hotel_id
      t.bigint :room_type_id
      t.date :date
      t.integer :total_inventory
      t.integer :total_reserved

      t.timestamps
    end
  end
end
