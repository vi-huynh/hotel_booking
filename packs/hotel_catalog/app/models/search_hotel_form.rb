class SearchHotelForm
  include Virtus.model
  include ActiveModel::Validations

  attribute :name, String

end
 