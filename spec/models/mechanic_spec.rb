require 'rails_helper'

RSpec.describe Mechanic do
  before do
    @john = Mechanic.create!(name: "John", years_experience:1)
    @paul = Mechanic.create!(name: "Paul", years_experience:2)
    @george = Mechanic.create!(name: "George", years_experience:3)
    @ringo = Mechanic.create!(name: "Ringo", years_experience:4)

    @six_flags = AmusementPark.create!(name: 'Six Flags', admission_cost: 75)
    @hurler = @six_flags.rides.create!(name: 'The Hurler', thrill_rating: 7, open: true)
    @scram = @six_flags.rides.create!(name: 'The Scrambler', thrill_rating: 4, open: true)
    @ferris = @six_flags.rides.create!(name: 'Ferris Wheel', thrill_rating: 7, open: false)
    @water = @six_flags.rides.create!(name: 'Thunder River', thrill_rating: 5, open: true)

    MechanicRide.create!(mechanic:@john, ride:@hurler)
    MechanicRide.create!(mechanic:@john, ride:@scram)
    MechanicRide.create!(mechanic:@john, ride:@ferris)
    MechanicRide.create!(mechanic:@john, ride:@water)
  end
  describe 'relationships' do
    it { should have_many :mechanic_rides }
    it { should have_many(:rides).through(:mechanic_rides) }
  end
  describe 'class methods' do
    it '#ave_years_exp returns ave years exp across all mechanics' do
      expect(Mechanic.ave_years_exp).to eq(2.5)
    end
  end

  describe 'instance methods' do
    it '#open_by_thrill returns rides that are open by most thrills first' do
      expect(@john.open_by_thrill).to eq([@hurler,@water,@scram])
    end
  end
end
