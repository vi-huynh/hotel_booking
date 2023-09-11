require 'rails_helper'

RSpec.describe "inventories/show", type: :view do
  before(:each) do
    assign(:inventory, Inventory.create!(
      hotel_id: "",
      room_type_id: "",
      total_inventory: 2,
      total_reserved: 3
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
  end
end
