class SearchBookingForm
  include Virtus.model
  include ActiveModel::Validations

  attribute :booking_number, String
  attribute :guest_email, String

end
 