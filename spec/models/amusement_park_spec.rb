require 'rails_helper'

RSpec.describe AmusementPark do
  describe 'relationships' do
    it { should have_many(:rides) }
  end

  describe 'instance methods' do
    describe '.admission_cost_to_currency' do
      it 'can format the admission cost to show two decimal places for dollars and cents' do
        amusement_park = AmusementPark.create!(name: 'Hershey Park', admission_cost: 50)

        expect(amusement_park.admission_cost_to_currency).to eq("50.00")
      end
    end

    describe '.alphabetical_rides' do
      it 'can order the amusement parks rides alphabetically' do
        amusement_park = AmusementPark.create!(name: 'Hershey Park', admission_cost: 50)
        ride_1 = amusement_park.rides.create!(name: "The Great Bear", thrill_rating: 9, open: true)
        ride_2 = amusement_park.rides.create!(name: "Farenheit", thrill_rating: 9, open: true)
        ride_3 = amusement_park.rides.create!(name: "Storm Runner", thrill_rating: 10, open: true)

        expect(amusement_park.alphabetical_rides).to eq([ride_2, ride_3, ride_4])
      end
    end
  end
end
