require 'rails_helper'

RSpec.describe Ride do
  describe 'relationships' do
    it { should belong_to(:amusement_park) }
  end

  describe 'methods' do

    it 'returns a collection in descending order of thrill' do
      park = AmusementPark.create!
      ride_1 = park.rides.create!(name: "Silly Swings", thrill_rating: 2, open: true)
      ride_2 = park.rides.create!(name: "Billy's Pirate Adventure", thrill_rating: 7, open: true)
      ride_3 = park.rides.create!(name: "The DOOM Tower", thrill_rating: 8, open: false)
      ride_4 = park.rides.create!(name: "Dizzy Dishes", thrill_rating: 4, open: true)

      expect(Ride.descending_thrill.first).to eq(ride_3)
      expect(Ride.descending_thrill.last).to eq(ride_1)

    end
  end
end
