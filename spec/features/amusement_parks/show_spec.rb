require 'rails_helper'

RSpec.describe "amusement park show page" do
  before do
    @park_1 = AmusementPark.create!(name: "Six Flags", admission_cost: 10)
    @park_2 = AmusementPark.create!(name: "Disneyland", admission_cost: 20)
    
    @ride_1 = Ride.create!(name: "Swings", thrill_rating: 1, open: true, amusement_park_id: @park_1.id)
    @ride_2 = Ride.create!(name: "Colossus", thrill_rating: 5, open: true, amusement_park_id: @park_1.id)
    @ride_3 = Ride.create!(name: "X2", thrill_rating: 5, open: false, amusement_park_id: @park_1.id)
    @ride_4 = Ride.create!(name: "Barb's Ride", thrill_rating: 5, open: true, amusement_park_id: @park_1.id)
    @ride_5 = Ride.create!(name: "Pirates of the Carribean", thrill_rating: 3, open: true, amusement_park_id: @park_2.id)

    @mech_1 = Mechanic.create!(name: "Jimmy", years_experience: 1)
    @mech_2 = Mechanic.create!(name: "Barb", years_experience: 2)

    @ride_mech_1 = RideMechanic.create!(ride_id: @ride_1.id, mechanic_id: @mech_1.id)
    @ride_mech_2 = RideMechanic.create!(ride_id: @ride_2.id, mechanic_id: @mech_1.id)
    @ride_mech_3 = RideMechanic.create!(ride_id: @ride_3.id, mechanic_id: @mech_1.id)
    @ride_mech_4 = RideMechanic.create!(ride_id: @ride_4.id, mechanic_id: @mech_2.id)
    @ride_mech_5 = RideMechanic.create!(ride_id: @ride_5.id, mechanic_id: @mech_2.id)
    
    visit "/parks/#{@park_1.id}"
  end

  it "has the name and price of admission" do
    expect(page).to have_content("Six Flags")
    expect(page).to have_content("Admission: $10.00")
    expect(page).to_not have_content("Disneyland")
    expect(page).to_not have_content("Admission: $20.00")
  end

  it "has the names of all rides" do
    expect(page).to have_content("Swings")
    expect(page).to have_content("Colossus")
    expect(page).to have_content("X2")
    expect(page).to have_content("Barb's Ride")
    expect(page).to_not have_content("Pirates of the Carribean")
  end

  it "has the average thrill rating of rides" do
    expect(page).to have_content("Average Thrill Rating: 4.0/5")
  end
end