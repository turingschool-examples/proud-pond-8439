require 'rails_helper'

RSpec.describe 'mechanics show page' do
  describe 'as a user' do
    describe 'when i visit a mechanic show page' do
      it 'i see their name, years of experience, and the names of rides theyre working on' do
        amusement_park = AmusementPark.create!(name: 'Hershey Park', admission_cost: 50)
        mechanic_1 = Mechanic.create!(name: "James", years_experience: 20)
        mechanic_2 = Mechanic.create!(name: "Ian", years_experience: 19)
        ride_1 = mechanic_1.rides.create!(name: "The Grizzly", thrill_rating: 8, open: true, amusement_park_id: amusement_park.id)
        ride_2 = mechanic_1.rides.create!(name: "Farenheit", thrill_rating: 9, open: true, amusement_park_id: amusement_park.id)
        ride_3 = mechanic_2.rides.create!(name: "Storm Chaser", thrill_rating: 10, open: true, amusement_park_id: amusement_park.id)

        visit "/mechanics/#{mechanic_1.id}"

        expect(page).to have_content(mechanic_1.name)
        expect(page).to have_content(ride_1.name)
        expect(page).to have_content(ride_2.name)
        expect(page).not_to have_content(mechanic_2.name)
        expect(page).not_to have_content(ride_3.name)
      end

      it 'and i only see rides that are open' do
        amusement_park = AmusementPark.create!(name: 'Hershey Park', admission_cost: 50)
        mechanic_1 = Mechanic.create!(name: "James", years_experience: 20)
        ride_1 = mechanic_1.rides.create!(name: "The Grizzly", thrill_rating: 8, open: true, amusement_park_id: amusement_park.id)
        ride_2 = mechanic_1.rides.create!(name: "Farenheit", thrill_rating: 9, open: false, amusement_park_id: amusement_park.id)

        visit "/mechanics/#{mechanic_1.id}"

        expect(page).to have_content(ride_1.name)
        expect(page).not_to have_content(ride_2.name)
      end

      it 'and the rides are listed by thrill rating in descending order (most thrills first)' do
        amusement_park = AmusementPark.create!(name: 'Hershey Park', admission_cost: 50)
        mechanic_1 = Mechanic.create!(name: "James", years_experience: 20)
        ride_1 = mechanic_1.rides.create!(name: "The Grizzly", thrill_rating: 8, open: true, amusement_park_id: amusement_park.id)
        ride_2 = mechanic_1.rides.create!(name: "Farenheit", thrill_rating: 9, open: true, amusement_park_id: amusement_park.id)

        visit "/mechanics/#{mechanic_1.id}"

        expect(ride_2.name).to appear_before(ride_1.name)
      end
    end
  end
end
