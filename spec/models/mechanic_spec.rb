require 'rails_helper'

RSpec.describe Mechanic do
  before do
    @park = AmusementPark.create!(name: "Six Flags", admission_cost: 10)
    
    @ride_1 = Ride.create!(name: "Swings", thrill_rating: 1, open: true, amusement_park_id: @park.id)
    @ride_2 = Ride.create!(name: "Colossus", thrill_rating: 5, open: true, amusement_park_id: @park.id)
    @ride_3 = Ride.create!(name: "X2", thrill_rating: 5, open: false, amusement_park_id: @park.id)
    @ride_4 = Ride.create!(name: "Barb's Ride", thrill_rating: 5, open: true, amusement_park_id: @park.id)

    @mech_1 = Mechanic.create!(name: "Jimmy", years_experience: 1)
    @mech_2 = Mechanic.create!(name: "Barb", years_experience: 2)

    @ride_mech_1 = RideMechanic.create!(ride_id: @ride_1.id, mechanic_id: @mech_1.id)
    @ride_mech_2 = RideMechanic.create!(ride_id: @ride_2.id, mechanic_id: @mech_1.id)
    @ride_mech_3 = RideMechanic.create!(ride_id: @ride_3.id, mechanic_id: @mech_1.id)
    @ride_mech_4 = RideMechanic.create!(ride_id: @ride_4.id, mechanic_id: @mech_2.id)
  end

  describe 'relationships' do
    it { should have_many(:ride_mechanics) }
    it { should have_many(:rides).through(:ride_mechanics) }
  end

  describe "class and instance methods" do
    it "#self.average_years_experience" do
      expect(Mechanic.average_years_experience).to eq(1.5)
    end
    
    it "#open_rides" do
      expect(@mech_1.open_rides).to eq([@ride_2, @ride_1])
    end
  end
end
