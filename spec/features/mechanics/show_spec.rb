require "rails_helper"
RSpec.describe "Mechanics Show Page" do
  before(:each) do
    @kings_island = AmusementPark.create!(name: "Kings Island", admission_cost: 50)
    @mech = Mechanic.create!(name: "Mech", years_experience: 2)
    @stan = Mechanic.create!(name: "Stan", years_experience: 25)
    @boris = Mechanic.create!(name: "Boris", years_experience: 12)
    @roller = Ride.create!(name: "Roller Coast", thrill_rating: 7, open: true, amusement_park_id: @kings_island.id)
    @yak = Ride.create!(name: "Yackity Yak", thrill_rating: 9, open: true, amusement_park_id: @kings_island.id)
    @bruiser = Ride.create!(name: "Bruiser", thrill_rating: 5, open: false, amusement_park_id: @kings_island.id)
    @zoomer = Ride.create!(name: "Zoomer", thrill_rating: 10, open: true, amusement_park_id: @kings_island.id)
    @mech_ride_1 = RideMechanic.create!(mechanic_id: @mech.id, ride_id: @roller.id)
    @mech_ride_2 = RideMechanic.create!(mechanic_id: @boris.id, ride_id: @bruiser.id)
    @mech_ride_3 = RideMechanic.create!(mechanic_id: @boris.id, ride_id: @yak.id)
  end

  it "shows the mechanic name, years of experience, and the rides they work on" do
    visit "/mechanics/#{@boris.id}"

    expect(page).to have_content("Name: #{@boris.name}")
    expect(page).to_not have_content("Name: #{@mech.name}")
    expect(page).to have_content("Experience: #{@boris.years_experience}")
    expect(page).to have_content("Rides: #{@yak.name}")
    expect(page).to_not have_content("Rides: #{@roller.name}")
  end

  it "only shows rides that are open" do
    visit "/mechanics/#{@boris.id}"

    expect(page).to have_content("Rides: #{@yak.name}")
    expect(page).to_not have_content("Rides: #{@bruiser.name}")
  end

  it "lists rides by thrill_rating" do
    mech_ride_4 = RideMechanic.create!(mechanic_id: @boris.id, ride_id: @zoomer.id)
    visit "/mechanics/#{@boris.id}"

    expect(@zoomer.name).to appear_before(@yak.name)
  end
end
