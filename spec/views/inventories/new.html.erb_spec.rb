require 'rails_helper'

RSpec.describe "inventories/new", type: :view do
  before(:each) do
    assign(:inventory, Inventory.new(
      hotel_id: "",
      room_type_id: "",
      total_inventory: 1,
      total_reserved: 1
    ))
  end

  it "renders new inventory form" do
    render

    assert_select "form[action=?][method=?]", inventories_path, "post" do

      assert_select "input[name=?]", "inventory[hotel_id]"

      assert_select "input[name=?]", "inventory[room_type_id]"

      assert_select "input[name=?]", "inventory[total_inventory]"

      assert_select "input[name=?]", "inventory[total_reserved]"
    end
  end
end
