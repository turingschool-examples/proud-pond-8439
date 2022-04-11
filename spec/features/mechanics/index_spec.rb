require 'rails_helper'

RSpec.describe "Mechanics index" do
  before :each do
    @six_flags = AmusementPark.create!(name: 'Six Flags', admission_cost: 75)
    @universal = AmusementPark.create!(name: 'Universal Studios', admission_cost: 80)

    @hurler = six_flags.rides.create!(name: 'The Hurler', thrill_rating: 7, open: true)
    @scrambler = six_flags.rides.create!(name: 'The Scrambler', thrill_rating: 4, open: true)
    @ferris_wheel = six_flags.rides.create!(name: 'Ferris Wheel', thrill_rating: 7, open: false)

    @jaws = universal.rides.create!(name: 'Jaws', thrill_rating: 5, open: true)

    @mech_1 = @hurler.mechanics.create!(name: "Billy Bighammer", yeras_experience: 50)
    @mech_2 = @hurler.mechanics.create!(name: "Linda Licehead", yeras_experience: 8)
    @mech_3 = @scrambler.mechanics.create!(name: "Rhonda Roundhouse", yeras_experience: 19)
  end

  it "lists all mechanic names & their years_experience" do
    visit "/mechanics"

    expect(page).to have_content("All Mechanics")
    expect(page).to have_content("Billy Bighammer\nYears of Experience: 50")
    expect(page).to have_content("Linda Licehead\nYears of Experience: 8")
    expect(page).to have_content("Rhonda Roundhouse\nYears of Experience: 19")
    expect(page).to have_content("Rhonda Roundhouse\nYears of Experience: 19")
  end

  it "lists avg years_experience for all mechanics" do
    visit "/mechanics"

    expect(page).to have_content("Average Experience: 25.7")
  end
end
