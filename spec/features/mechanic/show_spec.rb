require 'rails_helper'

RSpec.describe 'the mechanic show page' do
  it 'I see their name, years of experience, and the names of rides they’re working on
  And I only see rides that are open
  And the rides are listed by thrill rating in descending order (most thrills first)' do

    amusementpark1 = AmusementPark.create!(name: "White Heaven in Hell", admission_cost: 25)
    ride1 = amusementpark1.rides.create!(name: "Baby Cart on the River Styx", thrill_rating: 7,   open: true)
    ride2 = amusementpark1.rides.create!(name: "Masters of Death", thrill_rating: 9, open: false)
    ride3 = amusementpark1.rides.create!(name: "Shogun Assassin", thrill_rating: 6,   open: true)
    mechanic4 = Mechanic.create!(name: "Tomisaburo Wakayama", years_experience: 333)
    ride_mechanic1 = RideMechanic.create!(ride_id: ride1.id, mechanic_id: mechanic4.id)
    ride_mechanic2 = RideMechanic.create!(ride_id: ride2.id, mechanic_id: mechanic4.id)
    ride_mechanic3 = RideMechanic.create!(ride_id: ride3.id, mechanic_id: mechanic4.id)

    visit "/mechanics/#{mechanic4.id}"

    expect(page).to have_content(mechanic4.name)
    expect(page).to have_content(mechanic4.years_experience)
    expect(page).to have_content(ride1.name)
    expect(page).to have_content(ride3.name)
    expect(page).to_not have_content(ride2.name)
    expect(ride1.name).to appear_before(ride3.name)

  end

  it 'add a ride to a mechanic' do
    amusementpark1 = AmusementPark.create!(name: "White Heaven in Hell", admission_cost: 25)
    ride1 = amusementpark1.rides.create!(name: "Baby Cart on the River Styx", thrill_rating: 7,   open: true)
    ride2 = amusementpark1.rides.create!(name: "Masters of Death", thrill_rating: 9, open: true)
    ride3 = amusementpark1.rides.create!(name: "Shogun Assassin", thrill_rating: 6,   open: true)
    mechanic4 = Mechanic.create!(name: "Tomisaburo Wakayama", years_experience: 333)
    ride_mechanic1 = RideMechanic.create!(ride_id: ride1.id, mechanic_id: mechanic4.id)
    ride_mechanic2 = RideMechanic.create!(ride_id: ride2.id, mechanic_id: mechanic4.id)

    visit "/mechanics/#{mechanic4.id}"

    fill_in('Ride', with: "#{ride3.id}")

    click_button 'Submit'

    expect(page).to have_content(ride1.name)
    expect(page).to have_content(ride2.name)
    expect(page).to have_content(ride3.name)

  end
end
