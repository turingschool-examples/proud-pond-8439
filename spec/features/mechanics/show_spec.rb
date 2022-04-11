require 'rails_helper'

RSpec.describe 'the mechanics show' do
  it 'displays mechanics: names, and experience' do
    mechanic1 = Mechanic.create!(name: "Jim", experience: 10)
    mechanic2 = Mechanic.create!(name: "Tim", experience: 20)
    amusement_park1 = AmusementPark.create!(name: "Fun Park", admission_cost: 50)
    ride1 = Ride.create!(name: "Ride 1", thrill_rating: 5, open: true, amusement_park_id: amusement_park1.id)
    ridemech1 = RideMechanic.create!(ride_id: ride1.id, mechanic_id: mechanic1.id)

    visit "/mechanics/#{mechanic1.id}"

    expect(page).to have_content(mechanic1.name)
    expect(page).to have_content(mechanic1.experience)
  end

  it 'displays open rides by thrill rating' do
    mechanic1 = Mechanic.create!(name: "Jim", experience: 10)
    mechanic2 = Mechanic.create!(name: "Tim", experience: 20)
    amusement_park1 = AmusementPark.create!(name: "Fun Park", admission_cost: 50)
    ride1 = Ride.create!(name: "Ride 1", thrill_rating: 5, open: true, amusement_park_id: amusement_park1.id)
    ride2 = Ride.create!(name: "Ride 2", thrill_rating: 6, open: true, amusement_park_id: amusement_park1.id)
    ride3 = Ride.create!(name: "Ride 3", thrill_rating: 7, open: false, amusement_park_id: amusement_park1.id)
    ridemech1 = RideMechanic.create!(ride_id: ride1.id, mechanic_id: mechanic1.id)
    ridemech2 = RideMechanic.create!(ride_id: ride2.id, mechanic_id: mechanic1.id)
    ridemech3 = RideMechanic.create!(ride_id: ride3.id, mechanic_id: mechanic1.id)

    visit "/mechanics/#{mechanic1.id}"


    expect(page).to have_content(ride1.name)
    expect(page).to have_content(ride2.name)
    expect(page).to_not have_content(ride3.name)
  end

  it 'can add ride to mechanic' do
    mechanic1 = Mechanic.create!(name: "Jim", experience: 10)
    mechanic2 = Mechanic.create!(name: "Tim", experience: 20)
    amusement_park1 = AmusementPark.create!(name: "Fun Park", admission_cost: 50)
    ride1 = Ride.create!(name: "Ride 1", thrill_rating: 5, open: true, amusement_park_id: amusement_park1.id)
    ride2 = Ride.create!(name: "Ride 2", thrill_rating: 6, open: true, amusement_park_id: amusement_park1.id)
    ride3 = Ride.create!(name: "Ride 3", thrill_rating: 7, open: false, amusement_park_id: amusement_park1.id)
    ride4 = Ride.create!(name: "Ride 4", thrill_rating: 8, open: true, amusement_park_id: amusement_park1.id)
    ridemech1 = RideMechanic.create!(ride_id: ride1.id, mechanic_id: mechanic1.id)
    ridemech2 = RideMechanic.create!(ride_id: ride2.id, mechanic_id: mechanic1.id)
    ridemech3 = RideMechanic.create!(ride_id: ride3.id, mechanic_id: mechanic1.id)

    visit "/mechanics/#{mechanic1.id}"
    #save_and_open_page

    expect(find('form')).to have_content('Ride')
    fill_in 'Ride', with: ride4.id
    click_button 'Submit'
    expect(page).to have_current_path("/mechanics/#{mechanic1.id}")
    expect(page).to have_content('Ride 4')
  end

end
