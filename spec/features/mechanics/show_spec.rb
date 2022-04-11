require 'rails_helper'

RSpec.describe 'Mechanic Show Page', type: :feature do
  describe 'name, years of experience, and rides assigned to mechanic' do
    it 'displays mechanic name, experiences and rides' do
      amusement_park = AmusementPark.create!(name: 'Magic Mountain', admission_cost: 60)
      ride_1 = Ride.create!(name: 'Monster', thrill_rating: 10, open: true, amusement_park_id: amusement_park.id)
      ride_2 = Ride.create!(name: 'Aniamls', thrill_rating: 5, open: true, amusement_park_id: amusement_park.id)
      ride_3 = Ride.create!(name: 'Sky Scraper', thrill_rating: 8, open: true, amusement_park_id: amusement_park.id)
      ride_4 = Ride.create!(name: 'Tea Cup', thrill_rating: 3, open: false, amusement_park_id: amusement_park.id)
      mechanic = Mechanic.create!(name: 'George', years_experience: 5)
      mechanic_ride_1 = RideMechanic.create!(ride_id: ride_1.id, mechanic_id: mechanic.id)
      mechanic_ride_2 = RideMechanic.create!(ride_id: ride_2.id, mechanic_id: mechanic.id)
      mechanic_ride_3 = RideMechanic.create!(ride_id: ride_3.id, mechanic_id: mechanic.id)
      mechanic_ride_4 = RideMechanic.create!(ride_id: ride_4.id, mechanic_id: mechanic.id)
      visit "/mechanics/#{mechanic.id}"

      expect(page).to have_content(mechanic.name)
      expect(page).to have_content(mechanic.years_experience)
      expect(ride_1.name).to appear_before(ride_3.name)
      expect(ride_3.name).to appear_before(ride_2.name)
      expect(page).to_not have_content(ride_4.name)
    end
  end
end
