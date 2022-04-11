require 'rails_helper'

RSpec.describe 'the mechanic index page' do
  it 'When I visit the mechanics index page
  I see a header saying “All Mechanics”
  And I see a list of all mechanic’s names and their years of experience
  And I see the average years of experience across all mechanics' do

  mechanic1 = Mechanic.create!(name: "Chuck Norris", years_experience: 101)
  mechanic2 = Mechanic.create!(name: "Bruce Lee", years_experience: 99)
  mechanic3 = Mechanic.create!(name: "Scott Adkins", years_experience: 14)
  mechanic4 = Mechanic.create!(name: "Tomisaburo Wakayama", years_experience: 333)

  visit "/mechanics"

    expect(page).to have_content("All Mechanics")
    expect(page).to have_content(mechanic1.name)
    expect(page).to have_content(mechanic1.years_experience)
    expect(page).to have_content(mechanic2.name)
    expect(page).to have_content(mechanic2.years_experience)
    expect(page).to have_content(mechanic3.name)
    expect(page).to have_content(mechanic3.years_experience)
    expect(page).to have_content(mechanic4.name)
    expect(page).to have_content(mechanic4.years_experience)
    expect(page).to have_content("136.75")
  end

end
