module HotelManagement
  class SearchHotel < ApplicationService
    input :name, type: String, allow_nil: true
    input :per_page, default: 10, type: Integer
    input :page, default: 0, type: Integer, allow_nil: true
    output :hotels 
    
    def call 
      page_number = page.to_i > 1 ? page.to_i - 1  : 0
      self.hotels = HotelRepository.all.where('name ilike ?', "%#{name}%")
          .limit(per_page)
          .offset(page_number * per_page)
    end 
  end
end
