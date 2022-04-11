require 'rails_helper'

RSpec.describe 'Amusement Park Show Page', type: :feature do
  describe 'name, price and rides of specific amusement park' do
    it 'displays parks name, cost and rides' do
      amusement_park = AmusementPark.create!(name: 'Magic Mountain', admission_cost: 60)
      ride_1 = Ride.create!(name: 'Monster', thrill_rating: 10, open: true, amusement_park_id: amusement_park.id)
      ride_2 = Ride.create!(name: 'Animals', thrill_rating: 5, open: true, amusement_park_id: amusement_park.id)
      ride_3 = Ride.create!(name: 'Sky Scraper', thrill_rating: 8, open: true, amusement_park_id: amusement_park.id)
      ride_4 = Ride.create!(name: 'Tea Cup', thrill_rating: 3, open: false, amusement_park_id: amusement_park.id)
      mechanic = Mechanic.create!(name: 'George', years_experience: 5)
      mechanic_ride_1 = RideMechanic.create!(ride_id: ride_1.id, mechanic_id: mechanic.id)
      mechanic_ride_2 = RideMechanic.create!(ride_id: ride_2.id, mechanic_id: mechanic.id)
      mechanic_ride_3 = RideMechanic.create!(ride_id: ride_3.id, mechanic_id: mechanic.id)
      mechanic_ride_4 = RideMechanic.create!(ride_id: ride_4.id, mechanic_id: mechanic.id)
      visit "/amusement_parks/#{amusement_park.id}"
      expect(page).to have_content(amusement_park.name)
      expect(page).to have_content(amusement_park.admission_cost)
      expect(ride_2.name).to appear_before(ride_1.name)
      expect(ride_1.name).to appear_before(ride_3.name)
      expect(ride_3.name).to appear_before(ride_4.name)
      expect(page).to have_content("Average Thrill Rating of Rides: 6.5/10")
    end
  end
end
