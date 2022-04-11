require 'rails_helper'

RSpec.describe 'mechanics show page' do
  before (:each) do
    @mechanic1 = Mechanic.create!(name: "Hermione Baggins", years_experience: 7)
    @mechanic2 = Mechanic.create!(name: "Katniss Skywalker", years_experience: 12)

    @park = AmusementPark.create!(name: "Westeros World", admission_cost: 105)

    @ride1 = @park.rides.create!(name: "Cruise the Riverlands", thrill_rating: 3, open: true)
    @ride2 = @park.rides.create!(name: "The Night King", thrill_rating: 10, open: true)
    @ride3 = @park.rides.create!(name: "Viscerion's Voyage", thrill_rating: 6, open: false)
    @ride4 = @park.rides.create!(name: "Bran's Fall", thrill_rating: 8, open: true)
    @ride5 = @park.rides.create!(name: "Brianne's Bear", thrill_rating: 9, open: true)

    RideMechanic.create!(ride_id: @ride1.id, mechanic_id: @mechanic1.id)
    RideMechanic.create!(ride_id: @ride2.id, mechanic_id: @mechanic1.id)
    RideMechanic.create!(ride_id: @ride3.id, mechanic_id: @mechanic1.id)
    RideMechanic.create!(ride_id: @ride5.id, mechanic_id: @mechanic1.id)
    RideMechanic.create!(ride_id: @ride4.id, mechanic_id: @mechanic2.id)
  end

  it 'shows the mechanics name, yrs of experience and open rides they are working on' do
    visit "/mechanics/#{@mechanic1.id}"

    expect(page).to have_content(@mechanic1.name)
    expect(page).not_to have_content(@mechanic2.name)

    expect(page).to have_content(@ride1.name)
    expect(page).to have_content(@ride2.name)
    expect(page).to have_content(@ride5.name)
    expect(page).not_to have_content(@ride3.name)
    expect(page).not_to have_content(@ride4.name)
  end

  it 'shows rides in descending order of thrill rating' do
    visit "/mechanics/#{@mechanic1.id}"

    expect(@ride2.name).to appear_before(@ride5.name)
    expect(@ride5.name).to appear_before(@ride1.name)
    expect(@ride1.name).not_to appear_before(@ride2.name)
  end
end
