require 'rails_helper'

RSpec.describe "Amusement Parks show" do
  before :each do
    @six_flags = AmusementPark.create!(name: 'Six Flags', admission_cost: 75)
    @universal = AmusementPark.create!(name: 'Universal Studios', admission_cost: 80)

    @hurler = @six_flags.rides.create!(name: 'The Hurler', thrill_rating: 4, open: true)
    @scrambler = @six_flags.rides.create!(name: 'The Scrambler', thrill_rating: 7, open: true)
    @ferris_wheel = @six_flags.rides.create!(name: 'Ferris Wheel', thrill_rating: 7, open: false)

    @jaws = @universal.rides.create!(name: 'Jaws', thrill_rating: 5, open: true)

    @mech_1 = Mechanic.create!(name: "Billy Bighammer", years_experience: 50)
    @mech_2 = Mechanic.create!(name: "Linda Licehead", years_experience: 8)
    @mech_3 = Mechanic.create!(name: "Rhonda Roundhouse", years_experience: 19)

    @hurler.mechanics << @mech_1
    @scrambler.mechanics << @mech_1
    @ferris_wheel.mechanics << @mech_1
  end

  it "displays AP name and admissions cost" do
    visit "/amusement_parks/#{@six_flags.id}"
    # save_and_open_page
    expect(page).to have_content("Park Name: Six Flags")
    expect(page).to have_content("Cost of Admission: $75.00")
  end

  it "displays all ride names in alphabetical order" do
    visit "/amusement_parks/#{@six_flags.id}"
    # save_and_open_page
    expect("Ferris Wheel").to appear_before("The Hurler")
    expect("The Hurler").to appear_before("The Scrambler")
  end

  it "displays average thrill rating of rides" do
    visit "/amusement_parks/#{@six_flags.id}"
    # save_and_open_page
    expect(page).to have_content("Average Thrill Rating of Rides: 6.0/10")
  end
end
