require 'rails_helper'

RSpec.describe 'amusement park show page' do
  before (:each) do
    @park = AmusementPark.create!(name: "Westeros World", admission_cost: 105)
    @park2 = AmusementPark.create!(name: "Essos Extravaganza", admission_cost: 120)

    @ride1 = @park.rides.create!(name: "Cruise the Riverlands", thrill_rating: 3, open: true)
    @ride2 = @park.rides.create!(name: "The Night King", thrill_rating: 10, open: true)
    @ride3 = @park.rides.create!(name: "Viscerion's Voyage", thrill_rating: 6, open: false)
    @ride4 = @park.rides.create!(name: "Bran's Fall", thrill_rating: 8, open: true)
    @ride5 = @park.rides.create!(name: "Brianne's Bear", thrill_rating: 9, open: true)
    @ride6 = @park.rides.create!(name: "The Moon Door", thrill_rating: 8, open: true)

    @ride7 = @park2.rides.create!(name: "A Ride Has no Name", thrill_rating: 7, open: true)
  end

  it 'has the name and admissions cost of the park' do
    visit "/amusement_parks/#{@park.id}"

    expect(page).to have_content(@park.name)
    expect(page).to have_content(@park.admission_cost)
    expect(page).not_to have_content(@park2.name)
    expect(page).not_to have_content(@park2.admission_cost)
  end
end
