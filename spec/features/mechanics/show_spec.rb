require 'rails_helper'

RSpec.describe 'mechanics show' do

  it 'shows name, experience and rides being worked on' do
    mechanic_1 = Mechanic.create!(name: "Bill", years_experience: 12)
    park = AmusementPark.create!(name: "Thunder Point", admission_cost: 15)
    ride_1 = park.rides.create!(name: "Silly Swings", thrill_rating: 2, open: true)
    ride_2 = park.rides.create!(name: "Billy's Pirate Adventure", thrill_rating: 7, open: true)
    ride_3 = park.rides.create!(name: "The DOOM Tower", thrill_rating: 8, open: false)
    ride_4 = park.rides.create!(name: "Dizzy Dishes", thrill_rating: 4, open: true)
    association_1 = MechanicsRide.create!(mechanic_id: mechanic_1.id, ride_id: ride_1.id)
    association_2 = MechanicsRide.create!(mechanic_id: mechanic_1.id, ride_id: ride_3.id)
    association_3 = MechanicsRide.create!(mechanic_id: mechanic_1.id, ride_id: ride_4.id)


    visit "/mechanics/#{mechanic_1.id}"

    expect(page).to have_content(mechanic_1.name)
    expect(page).to have_content(mechanic_1.years_experience)
    within("#mechanic_show_rides_0") do
      expect(page).to have_content(ride_4.name)
    end
    within("#mechanic_show_rides_1") do
      expect(page).to have_content(ride_1.name)
    end

    expect(page).not_to have_content(ride_2.name) # Not working on this ride
    expect(page).not_to have_content(ride_3.name) # Only shows open rides
  end

  it 'has a simple form to add an existing ride to a mechanic' do
    mechanic_1 = Mechanic.create!(name: "Bill", years_experience: 12)
    park = AmusementPark.create!(name: "Thunder Point", admission_cost: 15)
    ride_1 = park.rides.create!(name: "Silly Swings", thrill_rating: 2, open: true)
    ride_2 = park.rides.create!(name: "Billy's Pirate Adventure", thrill_rating: 7, open: true)
    ride_3 = park.rides.create!(name: "The DOOM Tower", thrill_rating: 8, open: false)
    ride_4 = park.rides.create!(name: "Dizzy Dishes", thrill_rating: 4, open: true)
    association_2 = MechanicsRide.create!(mechanic_id: mechanic_1.id, ride_id: ride_3.id)
    association_3 = MechanicsRide.create!(mechanic_id: mechanic_1.id, ride_id: ride_4.id)

    visit "/mechanics/#{mechanic_1.id}"

    expect(page).not_to have_content(ride_1.name)

    fill_in :ride_id, with: ride_1.id
    click_on :add_ride

    expect(current_path).to eq("/mechanics/#{mechanic_1.id}")
    expect(page).to have_content(ride_1.name)
  end
end
