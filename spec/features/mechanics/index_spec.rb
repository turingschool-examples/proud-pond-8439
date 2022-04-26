require "rails_helper"

RSpec.describe "Mechanics Index Page", type: :feature do
  it "lists all mechanics and their attributes" do
    mechanic1 = Mechanic.create!(name: "Kara Smith", years_experience: 11)
    mechanic2 = Mechanic.create!(name: "Mike Dao", years_experience: 2)
    mechanic3 = Mechanic.create!(name: "Dani Coleman", years_experience: 3)

    visit "/mechanics"

    expect(page).to have_content("All Mechanics")

    within("#mechanics-#{mechanic1.id}") do
      expect(page).to have_content(mechanic1.name)
      expect(page).to have_content(mechanic1.years_experience)
      expect(page).to_not have_content(mechanic2.name)
    end

    within("#mechanics-#{mechanic2.id}") do
      expect(page).to have_content(mechanic2.name)
      expect(page).to have_content(mechanic2.years_experience)
      expect(page).to_not have_content(mechanic3.name)
    end

    within("#mechanics-#{mechanic3.id}") do
      expect(page).to have_content(mechanic3.name)
      expect(page).to have_content(mechanic3.years_experience)
      expect(page).to_not have_content(mechanic2.name)
    end
  end

  it "shows average years of experience for all mechanics listed" do
    mechanic1 = Mechanic.create!(name: "Kara Smith", years_experience: 11)
    mechanic2 = Mechanic.create!(name: "Mike Dao", years_experience: 2)
    mechanic3 = Mechanic.create!(name: "Dani Coleman", years_experience: 3)

    visit "/mechanics"

    expect(page).to have_content(5.33)
  end
end
