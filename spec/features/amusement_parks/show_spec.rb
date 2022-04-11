require 'rails_helper'

RSpec.describe 'Amusement Park show page' do
  before :each do
    @park = AmusementPark.create!(name: "Elitch Gardens", admission_cost: 65)
    @park_2 = AmusementPark.create!(name: 'Lakeside', admission_cost: 20)

    @mechanic_1 = Mechanic.create!(name:'Billy Johnson', years_experience: 8)

    @ride_1 = @park.rides.create!(name: 'The Twister', thrill_rating: 8, open: true)
    @ride_2 = @park.rides.create!(name: 'The Twister 2', thrill_rating: 10, open: false)
    @ride_3 = @park.rides.create!(name: 'Mind Eraser', thrill_rating: 10, open: true)
    @ride_4 = @park.rides.create!(name: 'Boomerang', thrill_rating: 7, open: true)

    @ride_5 = @park_2.rides.create!(name: 'Tower of Doom', thrill_rating: 6, open: true)

    MechanicRide.create!(mechanic_id: @mechanic_1.id, ride_id: @ride_1.id)
    MechanicRide.create!(mechanic_id: @mechanic_1.id, ride_id: @ride_2.id)
    MechanicRide.create!(mechanic_id: @mechanic_1.id, ride_id: @ride_3.id)

    visit "/amusement_parks/#{@park.id}"
  end

  it 'displays the parks name and addmission price' do
    expect(page).to have_content('Elitch Gardens')
    expect(page).to have_content('Admissions: $65.00')
  end

  it 'displays all rides for that park in alphabetical order' do
    expect(page).to_not have_content('Tower of Doom')

    expect('Boomerang').to appear_before('Mind Eraser')
    expect('Boomerang').to appear_before('The Twister')
    expect('Boomerang').to appear_before('The Twister 2')

    expect('Mind Eraser').to_not appear_before('Boomerang')
    expect('Mind Eraser').to appear_before('The Twister')
    expect('Mind Eraser').to appear_before('The Twister2')

    expect('The Twister').to_not appear_before('Boomerang')
    expect('The Twister').to_not appear_before('Mind Eraser')
    expect('The Twister').to appear_before('The Twister 2')

    expect('The Twister 2').to_not appear_before('The Twister')
    expect('The Twister 2').to_not appear_before('Mind Eraser')
    expect('The Twister 2').to_not appear_before('Boomerang')
  end

  it 'displays the average thrill rating out of ten; on the bottom of the page' do
    thrill_average = 'Average Thrill Rating of Rides: 8.75/10'

    expect(page).to have_content(thrill_average)

    expect(thrill_average).to_not appear_before('Elitch Gardens')
    expect(thrill_average).to_not appear_before('Admissions: $65.00')
    expect(thrill_average).to_not appear_before('Boomerang')
    expect(thrill_average).to_not appear_before('Mind Eraser')
    expect(thrill_average).to_not appear_before('The Twister')
    expect(thrill_average).to_not appear_before('The Twister 2')
  end
end
