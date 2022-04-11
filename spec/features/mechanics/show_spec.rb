require 'rails_helper'

describe 'Mechanics show page' do
  before do
    @mech_1 = Mechanic.create!(
      name: 'John Mulany',
      years_experience: 25
    )
    @mech_2 = Mechanic.create!(
      name: 'Jane Bologni',
      years_experience: 45
    )

    @amusement_park_1 = AmusementPark.create!(
      name: "Lincoln Log Land",
      admission_cost: 658
    )

    @ride_1 = @amusement_park_1.rides.create!(
      name: "Lincoln Log Slide",
      thrill_rating: 4,
      open: true
    )
    @ride_2 = @amusement_park_1.rides.create!(
      name: "Actual Log Cabin",
      thrill_rating: 1,
      open: true
    )
    @ride_3 = @amusement_park_1.rides.create!(
      name: "Space Log Roller Coaster",
      thrill_rating: 9,
      open: false
    )
    @ride_4 = @amusement_park_1.rides.create!(
      name: "Kiddy Log Jump",
      thrill_rating: 11,
      open: false
    )

    RideMechanic.create(mechanic_id: @mech_1.id, ride_id:@ride_1)
    RideMechanic.create(mechanic_id: @mech_1.id, ride_id:@ride_2)
    RideMechanic.create(mechanic_id: @mech_1.id, ride_id:@ride_3)

    RideMechanic.create(mechanic_id: @mech_2.id, ride_id:@ride_4)

    visit "/mechanics/#{@mech_1.id}"
  end

  it 'displays mechanics names and ages' do
    expect(page).to have_content("John Mulany")
    expect(page).to have_content("25")
    expect(page).not_to have_content("Jane Bologni")
  end
end
