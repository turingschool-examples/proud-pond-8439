require "rails_helper"

RSpec.describe "Mechanics show page" do
  let!(:scruffy) { Mechanic.create!(name: "Scruffy", years_experience: 17) }
  let!(:six_flags) { AmusementPark.create!(name: "Six Flags", admission_cost: 35) }
  let!(:batman) { Ride.create!(amusement_park_id: six_flags.id, name: "Batman", thrill_rating: 5, open: true) }
  let!(:superman) { Ride.create!(amusement_park_id: six_flags.id, name: "Superman", thrill_rating: 4, open: true) }
  let!(:hulk) { Ride.create!(amusement_park_id: six_flags.id, name: "Hulk", thrill_rating: 2, open: false) }

  let!(:scruffy_batman) { MechanicRide.create!(mechanic_id: scruffy.id, ride_id: batman.id) }
  let!(:scruffy_superman) { MechanicRide.create!(mechanic_id: scruffy.id, ride_id: superman.id) }
  let!(:scruffy_hulk) { MechanicRide.create!(mechanic_id: scruffy.id, ride_id: hulk.id) }

  it "shows mechanic info" do
    visit "/mechanics/#{scruffy.id}"

    expect(page).to have_content("Scruffy")
    expect(page).to have_content("17")

    scruffy.rides.each do |ride|
      expect(page).to have_content(ride.name)
    end

    expect(page).to_not have_content("Hulk")

    expect("Batman").to appear_before("Superman")
  end
end
