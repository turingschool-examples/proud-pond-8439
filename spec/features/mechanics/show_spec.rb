require 'rails_helper'

RSpec.describe 'Mechanic Show Page', type: :feature do

  before :each do
    @adam = Mechanic.create!(name: "Adam", years_experience: 9)

    @six_flags = AmusementPark.create!(name: 'Six Flags', admission_cost: 75)

    @hurler = @six_flags.rides.create!(name: 'The Hurler', thrill_rating: 7, open: true)
    @scrambler = @six_flags.rides.create!(name: 'The Scrambler', thrill_rating: 4, open: true)
    @ferris_wheel = @six_flags.rides.create!(name: 'Ferris Wheel', thrill_rating: 7, open: false)

    @mechanic_ride_1 = MechanicsRide.create!(mechanic_id: @adam.id, ride_id: @scrambler.id)
    @mechanic_ride_2 = MechanicsRide.create!(mechanic_id: @adam.id, ride_id: @hurler.id)
    @mechanic_ride_3 = MechanicsRide.create!(mechanic_id: @adam.id, ride_id: @ferris_wheel.id)
  end

  it 'Displays mechanic attributes' do
    visit "mechanics/#{@adam.id}"

    within("#mechanic-info") do
      expect(page).to have_content(@adam.name)
      expect(page).to have_content(@adam.years_experience)
    end
  end

  it 'displays all rides the mechanic is currently working on and are currently open' do
    visit "mechanics/#{@adam.id}"

    within("#mechanic-rides") do
      expect(page).to have_content(@scrambler.name)
      expect(page).to have_content(@scrambler.thrill_rating)
      expect(page).to have_content(@hurler.name)
      expect(page).to have_content(@hurler.name)
      expect(page).not_to have_content(@ferris_wheel.name)
    end
  end


  it 'displays all valid rides in descending order of thrill rating' do
    visit "mechanics/#{@adam.id}"

    high_thrill = find("#ride-#{@hurler.id}")
    low_thrill = find("#ride-#{@scrambler.id}")

    within("#mechanic-rides") do
      expect(high_thrill).to appear_before(low_thrill)
    end
  end

  it 'allows a user to add a ride to a mechanic' do
    visit "mechanics/#{@adam.id}"

    jaws = @six_flags.rides.create!(name: "Jaws", thrill_rating: 8, open: true)

    fill_in :ride_id, with: jaws.id
    click_on :submit

    expect(current_path).to eq("/mechanics/#{@adam.id}")

    within("#mechanic-rides") do
      expect(page).to have_content(@hurler.name)
      expect(page).to have_content(@hurler.thrill_rating)
    end
  end
end