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

  it 'lists the rides in alphabetical order' do
    visit "/amusement_parks/#{@park.id}"

    expect(@ride4.name).to appear_before(@ride5.name)
    expect(@ride5.name).to appear_before(@ride1.name)
    expect(@ride1.name).to appear_before(@ride6.name)
    expect(@ride6.name).to appear_before(@ride2.name)
    expect(@ride2.name).to appear_before(@ride3.name)
    expect(page).not_to have_content(@ride7.name)
  end

  it 'lists the average thrill rating of the parks rides' do
    visit "/amusement_parks/#{@park.id}"
    save_and_open_page

    expect(page).to have_content("Average Thrill Rating: 7.3/10")
    expect(page).not_to have_content("Average Thrill Rating: 7.3333/10")
  end
end
