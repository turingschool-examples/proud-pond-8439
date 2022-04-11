require 'rails_helper'

RSpec.describe AmusementPark do
  describe 'relationships' do
    it { should have_many(:rides) }
  end

  before :each do
    @park = AmusementPark.create!(name: "Elitch Gardens", admission_cost: 65)

    @ride_1 = @park.rides.create!(name: 'The Twister', thrill_rating: 8, open: true)
    @ride_2 = @park.rides.create!(name: 'The Twister 2', thrill_rating: 10, open: false)
    @ride_3 = @park.rides.create!(name: 'Mind Eraser', thrill_rating: 10, open: true)
    @ride_4 = @park.rides.create!(name: 'Boomerang', thrill_rating: 7, open: true)
  end

  describe 'instance methods' do
    it '.alphabetical_rides' do
      expect(@park.alphabetical_rides).to eq([@ride_4, @ride_3, @ride_1, @ride_2])
    end

    it '.average_ride_rating' do
      expect(@park.average_ride_rating).to eq(8.75)
    end
  end
end
