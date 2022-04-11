require 'rails_helper'

RSpec.describe "Mechanics show" do
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

  it "displays mechanic name and years of experience" do
    visit "/mechanics/#{@mech_1.id}"

    expect(page).to have_content("Name: Billy Bighammer")
    expect(page).to have_content("Years Experience: 50")

    expect(page).to_not have_content("Linda Licehead")
  end

  it "displays names of open rides mechanic is working on" do
    visit "/mechanics/#{@mech_1.id}"

    expect(page).to have_content("The Hurler")
    expect(page).to have_content("The Scrambler")

    expect(page).to_not have_content("Ferris Wheel")
    expect(page).to_not have_content("Jaws")
  end
end
