require 'rails_helper'

RSpec.describe 'Mechanics show page' do
  before :each do
    @park = AmusementPark.create!(name: "Elitch Gardens", admission_cost: 65)

    @mechanic_1 = Mechanic.create!(name:'Billy Johnson', years_experience: 8)
    @mechanic_2 = Mechanic.create!(name:'Sam Jones', years_experience: 10)

    @ride_1 = @park.rides.create!(name: 'The Twister', thrill_rating: 8, open: true)
    @ride_2 = @park.rides.create!(name: 'The Twister 2', thrill_rating: 10, open: false)
    @ride_3 = @park.rides.create!(name: 'Mind Eraser', thrill_rating: 12, open: true)
    @ride_4 = @park.rides.create!(name: 'Boomerang', thrill_rating: 7, open: true)

    MechanicRide.create!(mechanic_id: @mechanic_1.id, ride_id: @ride_1.id)
    MechanicRide.create!(mechanic_id: @mechanic_1.id, ride_id: @ride_2.id)
    MechanicRide.create!(mechanic_id: @mechanic_1.id, ride_id: @ride_3.id)
    
    MechanicRide.create!(mechanic_id: @mechanic_2.id, ride_id: @ride_4.id)

    visit "/mechanics/#{@mechanic_1.id}"
  end

  it 'shows attributes' do
    expect(page).to have_content('Name: Billy Johnson')
    expect(page).to have_content('Years experience: 8')
  end

  it 'shows only open rides that the mechanic is working on' do
    expect(page).to have_content('The Twister')
    expect(page).to have_content('Mind Eraser')
    expect(page).to_not have_content('The Twister 2')
    expect(page).to_not have_content('Boomerang')
  end

  it 'rides are shown in descending order by thrill rating' do
    expect('Mind Eraser').to appear_before('The Twister')
  end

  it 'has a form to add a ride' do
    expect(page).to_not have_content('Name: Boomerang')
    expect(page).to_not have_content('Thrill rating: 7')

    fill_in :ride_id, with: @ride_4.id
    click_button 'Submit'

    expect(current_path).to eq("/mechanics/#{@mechanic_1.id}")
    expect(page).to have_content('Ride: Boomerang')
    expect(page).to have_content('Thrill rating: 7')
  end
end
