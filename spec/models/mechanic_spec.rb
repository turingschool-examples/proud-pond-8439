require 'rails_helper'

RSpec.describe Mechanic do
  describe 'relationships' do
    it { should have_many :mechanic_rides}
    it { should have_many(:rides).through(:mechanic_rides) }
  end

  before :each do
    @park = AmusementPark.create!(name: "Elitch Gardens", admission_cost: 65)

    @mechanic_1 = Mechanic.create!(name:'Billy Johnson', years_experience: 26)
    @mechanic_2 = Mechanic.create!(name:'Sam Jones', years_experience: 25)
    @mechanic_3 = Mechanic.create!(name:'Francine Halls', years_experience: 15)

    @ride_1 = @park.rides.create!(name: 'The Twister', thrill_rating: 8, open: true)
    @ride_2 = @park.rides.create!(name: 'The Twister 2', thrill_rating: 10, open: false)
    @ride_3 = @park.rides.create!(name: 'Mind Eraser', thrill_rating: 12, open: true)

    MechanicRide.create!(mechanic_id: @mechanic_1.id, ride_id: @ride_1.id)
    MechanicRide.create!(mechanic_id: @mechanic_1.id, ride_id: @ride_2.id)
    MechanicRide.create!(mechanic_id: @mechanic_1.id, ride_id: @ride_3.id)
  end

  describe 'class methods' do
    it '#average_exp' do
      expect(Mechanic.average_exp).to eq(22)
    end
  end

  describe 'instance methods' do
    it '.open_rides' do
      expect(@mechanic_1.open_rides).to eq([@ride_1, @ride_3])
    end
  end
end
