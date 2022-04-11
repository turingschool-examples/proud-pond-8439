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

end