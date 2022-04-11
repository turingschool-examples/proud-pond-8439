require 'rails_helper'

RSpec.describe Ride do
  describe 'relationships' do
    it { should belong_to(:amusement_park) }
    it { should have_many :ride_mechanics }
    it { should have_many(:mechanics).through(:ride_mechanics) }
  end

  describe 'class methods' do
    describe '#average_thrill_rating' do
      it 'can return the average thrill rating of all rides' do
        amusement_park = AmusementPark.create!(name: 'Hershey Park', admission_cost: 50)
        ride_1 = amusement_park.rides.create!(name: "The Great Bear", thrill_rating: 7, open: true)
        ride_2 = amusement_park.rides.create!(name: "Farenheit", thrill_rating: 6, open: true)
        ride_3 = amusement_park.rides.create!(name: "Storm Runner", thrill_rating: 10, open: true)

        expect(Ride.average_thrill_rating).to eq(7.666666666666667)
      end
    end
  end
end
