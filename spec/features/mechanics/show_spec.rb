require "rails_helper"

RSpec.describe "Mechanics Show Page", type: :feature do
  it "shows a mechanic and attributes and rides they work on that are open and in descending order by thrill rating" do
    mechanic1 = Mechanic.create!(name: "Kara Smith", years_experience: 11)

    six_flags = AmusementPark.create!(name: "Six Flags", admission_cost: 75)

    hurler = six_flags.rides.create!(name: "The Hurler", thrill_rating: 7, open: true)
    scrambler = six_flags.rides.create!(name: "The Scrambler", thrill_rating: 4, open: true)
    ferris = six_flags.rides.create!(name: "Ferris Wheel", thrill_rating: 7, open: false)
    jaws = six_flags.rides.create!(name: "Jaws", thrill_rating: 5, open: true)

    mechanic_ride1 = RideMechanic.create!(ride_id: hurler.id, mechanic_id: mechanic1.id)
    mechanic_ride2 = RideMechanic.create!(ride_id: scrambler.id, mechanic_id: mechanic1.id)
    mechanic_ride3 = RideMechanic.create!(ride_id: ferris.id, mechanic_id: mechanic1.id)
    mechanic_ride4 = RideMechanic.create!(ride_id: jaws.id, mechanic_id: mechanic1.id)

    visit "/mechanics/#{mechanic1.id}"

    expect(page).to have_content(mechanic1.name)
    expect(page).to have_content(mechanic1.years_experience)
    expect(page).to have_content(hurler.name)
    expect(page).to have_content(scrambler.name)
    expect(page).to have_content(jaws.name)
    expect(page).to_not have_content(ferris.name)
  end

  it "has a form to add a ride" do
    mechanic1 = Mechanic.create!(name: "Kara Smith", years_experience: 11)

    six_flags = AmusementPark.create!(name: "Six Flags", admission_cost: 75)

    hurler = six_flags.rides.create!(name: "The Hurler", thrill_rating: 7, open: true)

    visit "/mechanics/#{mechanic1.id}"

    expect(page).to_not have_content(hurler.name)

    fill_in :ride_id, with: hurler.id
    click_on :submit

    expect(current_path).to eq("/mechanics/#{mechanic1.id}")
    expect(page).to have_content(hurler.name)
  end
end
