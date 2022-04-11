require "rails_helper"
RSpec.describe "Mechanics Index Page" do
  before(:each) do
    @mech = Mechanic.create!(name: "Mech", years_experience: 2)
    @stan = Mechanic.create!(name: "Stan", years_experience: 25)
    @boris = Mechanic.create!(name: "Boris", years_experience: 12)
  end
  it 'has a header called "All Mechanics"' do
    visit "/mechanics"
    expect(page).to have_content("All Mechanics")
  end

  it "lists all mechanics with with attributes" do
    visit "/mechanics"
    expect(page).to have_content("Name: #{@mech.name}")
    expect(page).to have_content("Experience: #{@mech.years_experience}")
    expect(page).to have_content("Name: #{@stan.name}")
    expect(page).to have_content("Experience: #{@stan.years_experience}")
    expect(page).to have_content("Name: #{@boris.name}")
    expect(page).to have_content("Experience: #{@boris.years_experience}")
  end

  it "lists the years of experience across all mechanics" do
    visit "/mechanics"
    save_and_open_page

    expect(page).to have_content(Mechanic.avg_years_experience)
  end
end
