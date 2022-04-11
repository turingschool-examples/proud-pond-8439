require 'rails_helper'

RSpec.describe "mechanics index page" do
  it 'has a header, names and years of experience for all mechanics, and average years of experience across mechanics' do
    mech_1 = Mechanic.create!(name: "Jimmy", years_experience: 1)
    mech_2 = Mechanic.create!(name: "Barb", years_experience: 2)
    mech_1 = Mechanic.create!(name: "Tom", years_experience: 3)

    visit "/mechanics"
    expect(page).to have_content("All Mechanics")
    
    within "#mechanic-#{mech_1.id}" do
      expect(page).to have_content("Jimmy")
      expect(page).to have_content("Years of experience: 1")
    end
    within "#mechanic-#{mech_2.id}" do
      expect(page).to have_content("Barb")
      expect(page).to have_content("Years of experience: 2")
    end
    within "#mechanic-#{mech_3.id}" do
      expect(page).to have_content("Tom")
      expect(page).to have_content("Years of experience: 3")
    end
    
    expect(page).to have_content("Average years of experience: 2")
    
  end
end
