class InventoryRepository
  class << self
    def all
      Inventory.all
    end

    def find_by(*attrs)
      Inventory.find_by(*attrs)
    end
    
    def destroy(inventory)
      inventory.destroy
    end
    
    def available_for(check_in_date:, check_out_date:, hotel_id:, room_type_id:)
      Inventory.available(check_in_date, check_out_date)
               .where(hotel_id: hotel_id, room_type_id: room_type_id)
    end
    
    def min_inventory(from_date:, to_date:, room_type_id:)
      Inventory.where(room_type_id: room_type_id)
               .where('date between ? AND ?', from_date, to_date)
               .minimum('total_inventory - total_reserved')
    end
    
  end
end
