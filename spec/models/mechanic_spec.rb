require 'rails_helper'

RSpec.describe Mechanic do
  describe 'relationships' do
    it { should have_many(:mechanic_rides) }
    it { should have_many(:rides).through(:mechanic_rides) }
  end

  describe 'class methods' do
    before :each do
      @mechanic1 = Mechanic.create!(name: "Pabu", years_experience: 4)
      @mechanic2 = Mechanic.create!(name: "Thor", years_experience: 2)
      @mechanic2 = Mechanic.create!(name: "Loki", years_experience: 6)
    end
    it '#average_years_experience' do
      expect(Mechanic.average_years_experience).to eq(4)
    end
  end
  describe 'instance methods' do
    before :each do
      @amusement_park = AmusementPark.create!(name: "Ferret Land", admission_cost: 100)

      @mechanic1 = Mechanic.create!(name: "Pabu", years_experience: 4)
      @mechanic2 = Mechanic.create!(name: "Thor", years_experience: 2)
      @mechanic3 = Mechanic.create!(name: "Loki", years_experience: 6)

      @ride1 = Ride.create!(amusement_park_id: @amusement_park.id, name: "Water slide", thrill_rating: 5, open: true)
      @ride2 = Ride.create!(amusement_park_id: @amusement_park.id, name: "Tube coaster", thrill_rating: 10, open: true)
      @ride3 = Ride.create!(amusement_park_id: @amusement_park.id, name: "Spinning cups", thrill_rating: 2, open: false)

      MechanicRide.create!(ride_id: @ride1.id, mechanic_id: @mechanic1.id)
      MechanicRide.create!(ride_id: @ride2.id, mechanic_id: @mechanic1.id)
      MechanicRide.create!(ride_id: @ride3.id, mechanic_id: @mechanic1.id)
    end
    it '#best_thrill_rating' do
      expect(@mechanic1.best_thrill_rating).to eq([@ride2, @ride1])
    end
  end
end
