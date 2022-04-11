require 'rails_helper'

RSpec.describe 'mechanics index' do
  before :each do
    @mechanic_1 = Mechanic.create!(name: "Joey Simpson", years_experience: 5)
    @mechanic_2 = Mechanic.create!(name: "Dolly Jackson", years_experience: 16)
    @mechanic_3 = Mechanic.create!(name: "Mac Berger", years_experience: 12)
    @mechanic_4 = Mechanic.create!(name: "Red Valance", years_experience: 24)
  end

  it 'header' do
    visit '/mechanics'
    within '.header' do
      expect(page).to have_content("All Mechanics")
    end
  end

  it 'displays their name, years_experience, names of rides theyre working on' do
    six_flags = AmusementPark.create!(name: 'Six Flags', admission_cost: 75)
    hurler = six_flags.rides.create!(name: 'The Hurler', thrill_rating: 7, open: true)
    scrambler = six_flags.rides.create!(name: 'The Scrambler', thrill_rating: 4, open: true)
    ferris = six_flags.rides.create!(name: 'Ferris Wheel', thrill_rating: 7, open: false)


    visit '/mechanics'
    within "#mechanic-#{@mechanic_1.id}" do
      expect(page).to have_content("Joey Simpson")
      expect(page).to have_content("5")
      expect(page).to have_content("The Hurler")
      expect(page).to have_content("The Scrambler")
      expect(page).to have_no_content("Ferris Wheel")
    end
  end
end
