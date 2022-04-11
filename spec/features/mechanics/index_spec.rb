require "rails_helper"

RSpec.describe "Mechanics Index Page", type: :feature do
  it "lists all mechanics and their attributes" do
    mechanic1 = Mechanic.create!(name: "Kara Smith", years_experience: 11)
    mechanic2 = Mechanic.create!(name: "Mike Dao", years_experience: 7)
    mechanic3 = Mechanic.create!(name: "Dani Coleman", years_experience: 9)

    visit "/mechanics"

    expect(page).to have_content("All Mechanics")
    expect(page).to have_content(mechanic1.name)
    expect(page).to have_content(mechanic1.years_experience)
    expect(page).to have_content(mechanic2.name)
    expect(page).to have_content(mechanic2.years_experience)
    expect(page).to have_content(mechanic3.name)
    expect(page).to have_content(mechanic3.years_experience)
  end
end
