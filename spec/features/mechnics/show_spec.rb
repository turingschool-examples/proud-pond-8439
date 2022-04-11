require 'rails_helper'

RSpec.describe 'mechanics show' do
  before :each do
    @mechanic_1 = Mechanic.create!(name: "Joey Simpson", years_experience: 5)
    @mechanic_2 = Mechanic.create!(name: "Dolly Jackson", years_experience: 16)
    @mechanic_3 = Mechanic.create!(name: "Mac Berger", years_experience: 12)
    @mechanic_4 = Mechanic.create!(name: "Red Valance", years_experience: 24)
  end

  it 'displays their name and years_experience' do

    visit "/mechanics/#{@mechanic_1.id}"

    expect(page).to have_content("Joey Simpson")
    expect(page).to have_content("5")
    expect(page).to have_no_content("Dolly Jackson")
  end

  xit 'displays the names of rides they work on' do
    six_flags = AmusementPark.create!(name: 'Six Flags', admission_cost: 75)
    hurler = six_flags.rides.create!(name: 'The Hurler', thrill_rating: 7, open: true)
    scrambler = six_flags.rides.create!(name: 'The Scrambler', thrill_rating: 4, open: true)
    ferris = six_flags.rides.create!(name: 'Ferris Wheel', thrill_rating: 7, open: false)
    MechanicRide.create!(mechanic_id: "#{@mechanic_1.id}", ride_id: "#{hurler.id}")
    MechanicRide.create!(mechanic_id: "#{@mechanic_1.id}", ride_id: "#{scrambler.id}")
    MechanicRide.create!(mechanic_id: "#{@mechanic_1.id}", ride_id: "#{ferris.id}")

    visit "/mechanics/#{@mechanic_1.id}"

    expect(page).to have_content("The Hurler")
    expect(page).to have_content("The Scrambler")
    expect(page).to have_no_content("Ferris Wheel")
  end
end
