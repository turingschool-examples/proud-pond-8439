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

  it 'displays the names of rides they work on in order by thrill rating' do
    six_flags = AmusementPark.create!(name: 'Six Flags', admission_cost: 75)
    hurler = six_flags.rides.create!(name: 'The Hurler', thrill_rating: 7, open: true)
    scrambler = six_flags.rides.create!(name: 'The Scrambler', thrill_rating: 10, open: true)
    ferris = six_flags.rides.create!(name: 'Ferris Wheel', thrill_rating: 7, open: false)
    gravitron = six_flags.rides.create!(name: 'Gravitron', thrill_rating: 3, open: true)

    MechanicRide.create!(mechanic_id: "#{@mechanic_1.id}", ride_id: "#{hurler.id}")
    MechanicRide.create!(mechanic_id: "#{@mechanic_1.id}", ride_id: "#{scrambler.id}")
    MechanicRide.create!(mechanic_id: "#{@mechanic_1.id}", ride_id: "#{ferris.id}")
    MechanicRide.create!(mechanic_id: "#{@mechanic_1.id}", ride_id: "#{gravitron.id}")


    visit "/mechanics/#{@mechanic_1.id}"

    expect(page).to have_content("The Hurler")
    expect(page).to have_content("The Scrambler")
    expect(page).to have_content("Gravitron")

    expect(page).to have_no_content("Ferris Wheel")

    expect("The Scrambler").to appear_before("The Hurler")
    expect("The Hurler").to appear_before("Gravitron")

  end

  it 'has a form to add a new ride' do
    six_flags = AmusementPark.create!(name: 'Six Flags', admission_cost: 75)
    jaws = six_flags.rides.create!(name: 'Jaws', thrill_rating: 5, open: true)

    visit "/mechanics/#{@mechanic_1.id}"

    expect(page).to have_no_content("Jaws")

    fill_in :ride_id, with: "#{jaws.id}"
    click_on "Submit"

    expect(current_path).to eq("/mechanics/#{@mechanic_1.id}")
    expect(page).to have_content("Jaws")
  end

end
