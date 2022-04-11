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

end
