require 'rails_helper'

RSpec.describe "mechanic show page" do
  before do
    @park = AmusementPark.create!(name: "Six Flags", admission_cost: 10)
    
    @ride_1 = Ride.create!(name: "Swings", thrill_rating: 1, open: true, amusement_park_id: @park.id)
    @ride_2 = Ride.create!(name: "Colossus", thrill_rating: 5, open: true, amusement_park_id: @park.id)
    @ride_3 = Ride.create!(name: "X2", thrill_rating: 5, open: false, amusement_park_id: @park.id)
    @ride_4 = Ride.create!(name: "Barb's Ride", thrill_rating: 5, open: false, amusement_park_id: @park.id)

    @mech_1 = Mechanic.create!(name: "Jimmy", years_experience: 1)
    @mech_2 = Mechanic.create!(name: "Barb", years_experience: 2)

    @ride_mech_1 = RideMechanic.create!(ride_id: @ride_1.id, mechanic_id: @mech_1.id)
    @ride_mech_2 = RideMechanic.create!(ride_id: @ride_2.id, mechanic_id: @mech_1.id)
    @ride_mech_3 = RideMechanic.create!(ride_id: @ride_3.id, mechanic_id: @mech_1.id)
    @ride_mech_4 = RideMechanic.create!(ride_id: @ride_4.id, mechanic_id: @mech_2.id)
    
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
    expect(page).to_not have_content("Barb's Ride")
  end
  
  it "rides are listed with highest thrill rating first" do
    expect("Colossus").to appear_before("Swings")
  end
  
  it "has a form to add a ride to their workload" do
    expect(page).to_not have_content("Barb's Ride")
    fill_in "Ride id", with: "#{@ride_4.id}"
    click_on "Submit"
    expect(current_path).to eq("/mechanics/#{@mech_1.id}")
    expect(page).to have_content("Barb's Ride")
  end
end

# As a user,
# When I go to a mechanics show page
# I see a form to add a ride to their workload
# When I fill in that field with an id of an existing ride and hit submit
# I’m taken back to that mechanic's show page
# And I see the name of that newly added ride on this mechanics show page