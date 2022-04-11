require 'rails_helper'

RSpec.describe Ride do
  describe 'relationships' do
    it { should belong_to(:amusement_park) }
  end

  describe 'class methods' do
    six_flags = AmusementPark.create!(name: 'Six Flags', admission_cost: 75)
    hurler = six_flags.rides.create!(name: 'The Hurler', thrill_rating: 7, open: true)
    scrambler = six_flags.rides.create!(name: 'The Scrambler', thrill_rating: 10, open: true)
    ferris = six_flags.rides.create!(name: 'Ferris Wheel', thrill_rating: 2, open: false)
    it '#order_by_thrill' do
      expect(Ride.order_by_thrill).to eq([scrambler, hurler, ferris])
    end
  end
end
