require "rails_helper"

feature "adding a business" do
  let (:venue) { FactoryGirl.build(:business) }
  scenario "correctly provide information" do
    visit new_business_path
    fill_in "Name", with: venue.name
    fill_in "Address", with: venue.address
    fill_in "Short description", with: venue.summary
    click_button "Submit"
    expect(page).to have_content venue.name
    expect(page).to have_content venue.address
    expect(page).to have_content venue.summary
    expect(page).to have_content "Venue saved"
  end

  scenario "missing information" do
    visit new_business_path
    fill_in "Name", with: venue.name
    click_button "Submit"
    expect(page).to have_content "errors prohibited this venue from being saved"
  end

  scenario "navigate from root" do
    visit root_path
    click_link "Add Venue"
    expect(current_path).to eq(new_business_path)
  end

end