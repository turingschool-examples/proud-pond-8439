require 'rails_helper'

RSpec.describe AmusementPark do
  before :each do
    @six_flags = AmusementPark.create!(name: 'Six Flags', admission_cost: 75)
    @universal = AmusementPark.create!(name: 'Universal Studios', admission_cost: 80)

    @hurler = @six_flags.rides.create!(name: 'The Hurler', thrill_rating: 4, open: true)
    @scrambler = @six_flags.rides.create!(name: 'The Scrambler', thrill_rating: 7, open: true)
    @ferris_wheel = @six_flags.rides.create!(name: 'Ferris Wheel', thrill_rating: 7, open: false)

    @jaws = @universal.rides.create!(name: 'Jaws', thrill_rating: 5, open: true)
  end

  describe 'relationships' do
    it { should have_many(:rides) }
  end

  describe "instance methods" do
    it "returns names of all rides in alphabetical order" do
      expect(@six_flags.all_park_rides).to eq([@ferris_wheel, @hurler, @scrambler])
    end
  end
end
