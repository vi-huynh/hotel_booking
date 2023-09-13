class HotelRepository
  class << self
    def all
      Hotel.all
    end

    def find_by(*attrs)
      Hotel.find_by(*attrs)
    end

    def find_id(id)
      Hotel.find(id)
    end
    
    def destroy(hotel)
      hotel.destroy
    end
    
    def by_slug(slug)
      Hotel.where('slug = ?', slug)
    end
  end
end