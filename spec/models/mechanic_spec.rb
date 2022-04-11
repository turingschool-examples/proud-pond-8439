require 'rails_helper'

RSpec.describe Mechanic do
  describe 'relationships' do
    it { should have_many :mechanic_rides }
    it { should have_many(:rides).through(:mechanic_rides) }
  end

  describe 'class methods' do 
    before :each do 
      @josh = Mechanic.create!(name: 'Josh', years_experience: 2)
      @sal = Mechanic.create!(name: 'Sal', years_experience: 6)
      @kim = Mechanic.create!(name: 'Kim', years_experience: 10)
    end

    describe '#average_years_experience' do
      it 'returns the average years_experience of all mechanics' do 
        expect(Mechanic.average_years_experience).to eq(6)
      end
    end
  end

  describe 'instance methods' do 
    before :each do 
      @kim = Mechanic.create!(name: 'Kim', years_experience: 10)
      six_flags = AmusementPark.create!(name: 'Six Flags', admission_cost: 75)
      @scrambler = six_flags.rides.create!(name: 'The Scrambler', thrill_rating: 4, open: true)
      @hurler = six_flags.rides.create!(name: 'The Hurler', thrill_rating: 7, open: true)
      @ferris = six_flags.rides.create!(name: 'Ferris Wheel', thrill_rating: 6, open: false)
      kim_fixes_things = MechanicRide.create!(mechanic: @kim, ride: @hurler)
      kim_works_more = MechanicRide.create!(mechanic: @kim, ride: @scrambler)
      kim_fixes_them_all = MechanicRide.create!(mechanic: @kim, ride: @ferris)

    end

    describe '.open_rids_by_rating' do 
      it 'returns open rides by rating in descending order' do 
        expect(@kim.open_rides_by_rating).to eq([@hurler, @scrambler])
      end
    end
  end

end
