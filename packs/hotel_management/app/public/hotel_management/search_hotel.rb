module HotelManagement
  class SearchHotel < ApplicationService
    input :name
    output :hotels 
    
    def call 
      self.hotels = HotelRepository.all.where('name ilike ?', "%#{name}%")
    end 
  end
end
