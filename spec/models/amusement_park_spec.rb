require 'rails_helper'

RSpec.describe AmusementPark do
  describe 'relationships' do
    it { should have_many(:rides) }
  end

  before do
    @amusement_park_1 = AmusementPark.create!(
      name: "Lincoln Log Land",
      admission_cost: 658
    )

    @ride_1 = @amusement_park_1.rides.create!(
      name: "Actual Log Cabin",
      thrill_rating: 1,
      open: true
    )
    @ride_2 = @amusement_park_1.rides.create!(
      name: "Space Log Roller Coaster",
      thrill_rating: 9,
      open: false
    )
    @ride_3 = @amusement_park_1.rides.create!(
      name: "Lincoln Log Slide",
      thrill_rating: 4,
      open: true
    )
  end

  describe 'instance methods' do
    it 'sorts rides alphabeticvally' do
      expect(@amusement_park_1.rides).to eq([@ride_1, @ride_2, @ride_3])
      expect(@amusement_park_1.sort_rides).to eq([@ride_1, @ride_3, @ride_2])
    end

    it 'calculates average thrill rating of all rides' do
      expect(@amusement_park_1.avg_thrills.to_f).to eq(4.6666666666666667)
    end
  end
end
