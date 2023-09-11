class SearchForm
  include Virtus.model
  include ActiveModel::Validations

  attribute :check_in_date, Date
  attribute :check_out_date, Date
  attribute :hotel, Hotel

end
