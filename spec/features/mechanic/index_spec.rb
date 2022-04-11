require "rails_helper"

RSpec.describe "Mechanics index page" do
  let!(:jeff) { Mechanic.create!(name: "Jeff", years_experience: 2) }
  let!(:scruffy) { Mechanic.create!(name: "Scruffy", years_experience: 17) }
  let!(:don) { Mechanic.create!(name: "Don", years_experience: 5) }

  it "has header" do
    visit "/mechanics"

    expect(page).to have_content("All Mechanics")
  end

  it "lists all mechanics + years experience" do
    visit "/mechanics"

    expect(page).to have_content("Jeff")
    expect(page).to have_content("2")
    expect(page).to have_content("Scruffy")
    expect(page).to have_content("17")
    expect(page).to have_content("Don")
    expect(page).to have_content("5")
  end

  it "lists average experience across all mechanics" do
    visit "/mechanics"

    expect(page).to have_content("Average years experience: 8")
  end
end
