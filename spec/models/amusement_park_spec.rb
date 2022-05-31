require 'rails_helper'

RSpec.describe AmusementPark do
  describe 'relationships' do
    it { should have_many(:rides) }
  end

  describe 'instance methods' do 
    before :each do 
      @six_flags = AmusementPark.create!(name: 'Six Flags', admission_cost: 75)
      @scrambler = @six_flags.rides.create!(name: 'The Scrambler', thrill_rating: 5, open: true)
      @ferris = @six_flags.rides.create!(name: 'Ferris Wheel', thrill_rating: 6, open: true)
      @hurler = @six_flags.rides.create!(name: 'The Hurler', thrill_rating: 7, open: true)
    end 


    describe '.rides_alpha' do 
      it 'sorts rides alphabetically' do 
        expect(@six_flags.rides_alpha).to eq([@ferris, @hurler, @scrambler])
      end
    end

    describe '.average_thrill_rating' do 
      it 'returns the average thrill rating' do 
        expect(@six_flags.average_thrill_rating).to eq(6)
      end
    end

  end
end
