require 'rails_helper'

RSpec.describe "inventories/edit", type: :view do
  let(:inventory) {
    Inventory.create!(
      hotel_id: "",
      room_type_id: "",
      total_inventory: 1,
      total_reserved: 1
    )
  }

  before(:each) do
    assign(:inventory, inventory)
  end

  it "renders the edit inventory form" do
    render

    assert_select "form[action=?][method=?]", inventory_path(inventory), "post" do

      assert_select "input[name=?]", "inventory[hotel_id]"

      assert_select "input[name=?]", "inventory[room_type_id]"

      assert_select "input[name=?]", "inventory[total_inventory]"

      assert_select "input[name=?]", "inventory[total_reserved]"
    end
  end
end
