require 'rails_helper'

RSpec.describe "inventories/index", type: :view do
  before(:each) do
    assign(:inventories, [
      Inventory.create!(
        hotel_id: "",
        room_type_id: "",
        total_inventory: 2,
        total_reserved: 3
      ),
      Inventory.create!(
        hotel_id: "",
        room_type_id: "",
        total_inventory: 2,
        total_reserved: 3
      )
    ])
  end

  it "renders a list of inventories" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(3.to_s), count: 2
  end
end
