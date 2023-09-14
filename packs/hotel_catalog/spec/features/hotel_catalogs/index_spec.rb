require "rails_helper"

RSpec.feature "Hotel listing", type: :feature do
  scenario "Hotel listing is empty" do
    visit "/hotels"
    expect(page).to have_text("Listing hotels")
  end

  scenario "Hotel listing is not empty" do
    visit "/hotels"
    expect(page).to have_text("Listing hotels")
  end
end