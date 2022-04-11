require 'rails_helper'

RSpec.describe "mechanic show page" do
  before do
    @park = AmusementPark.create!(name: "Six Flags", admission_cost: 10)
    
    @ride_1 = Ride.create!(name: "Swings", thrill_rating: 1, open: true, amusement_park_id: @park.id)
    @ride_2 = Ride.create!(name: "Colossus", thrill_rating: 5, open: true, amusement_park_id: @park.id)
    @ride_3 = Ride.create!(name: "X2", thrill_rating: 5, open: false, amusement_park_id: @park.id)

    @mech_1 = Mechanic.create!(name: "Jimmy", years_experience: 1)
    @mech_2 = Mechanic.create!(name: "Barb", years_experience: 2)

    @ride_mech_1 = RideMechanic.create!(ride_id: @ride_1.id, mechanic_id: @mech_1.id)
    @ride_mech_2 = RideMechanic.create!(ride_id: @ride_2.id, mechanic_id: @mech_1.id)
    @ride_mech_3 = RideMechanic.create!(ride_id: @ride_3.id, mechanic_id: @mech_1.id)
    
    visit "/mechanics/#{@mech_1.id}"
  end


  it "has the mechanic's name and years of experience" do
    expect(page).to have_content("Jimmy")
    expect(page).to have_content("Years of experience: 1")
    expect(page).to_not have_content("Barb")
    expect(page).to_not have_content("Years of experience: 2")
  end
  
  it "has the names of open rides they are working on" do
    expect(page).to have_content("Swings")
    expect(page).to have_content("Colossus")
    expect(page).to_not have_content("X2")
  end
  
  it "rides are listed with highest thrill rating first" do
    expect("Colossus").to appear_before("Swings")
  end
end


# As a user,
# When I visit a mechanic show page
# I see their name, years of experience, and the names of rides they’re working on
# And I only see rides that are open
# And the rides are listed by thrill rating in descending order (most thrills first)