require 'rails_helper'

RSpec.describe 'amusement_parks show page' do
  describe 'as a user' do
    describe 'when i visit an amusement park show page' do
      before :each do
        @amusement_park = AmusementPark.create!(name: 'Hershey Park', admission_cost: 50)
        @ride_1 = @amusement_park.rides.create!(name: "The Great Bear", thrill_rating: 9, open: true)
        @ride_2 = @amusement_park.rides.create!(name: "Farenheit", thrill_rating: 9, open: true)
        @ride_3 = @amusement_park.rides.create!(name: "Storm Runner", thrill_rating: 10, open: true)
      end

      it 'i see the name and price of admission for that park' do
        visit "/amusement_parks/#{@amusement_park.id}"

        expect(page).to have_content(@amusement_park.name)
        expect(page).to have_content("Admission Price: $50.00")
      end

      it 'and i see the names of all the rides listed in alphabetical order' do
        expect(@ride_2.name).to appear_before(@ride_3.name)
        expect(@ride_3.name).to appear_before(@ride_1.name)
      end

      it 'and i see the average thrill rating of the parks rides' do
        expect(page).to have_content("Average Thrill Rating of Rides: 9.3/10")
      end
    end
  end
end
