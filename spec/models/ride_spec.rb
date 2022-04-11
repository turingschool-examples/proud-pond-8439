require 'rails_helper'

RSpec.describe Ride do
  describe 'relationships' do
    it { should belong_to(:amusement_park) }
  end

  describe 'class methods' do
    it "orders by thrill level" do
      @six_flags = AmusementPark.create!(name: 'Six Flags', admission_cost: 75)

      @scrambler = @six_flags.rides.create!(name: 'The Scrambler', thrill_rating: 4, open: true)
      @carousel = @six_flags.rides.create!(name: 'Carousel', thrill_rating: 1, open: true)
      @hurler = @six_flags.rides.create!(name: 'The Hurler', thrill_rating: 7, open: true)

      expect(Ride.thrill_level).to eq([@hurler, @scrambler, @carousel])
    end

    it "order by name" do
      @six_flags = AmusementPark.create!(name: 'Six Flags', admission_cost: 75)

      @scrambler = @six_flags.rides.create!(name: 'The Scrambler', thrill_rating: 4, open: true)
      @carousel = @six_flags.rides.create!(name: 'Carousel', thrill_rating: 1, open: true)
      @hurler = @six_flags.rides.create!(name: 'The Hurler', thrill_rating: 7, open: true)

      expect(Ride.order_by_name).to eq([@carousel, @hurler, @scrambler])
    end

    it "can find the average thrill rating" do
      @six_flags = AmusementPark.create!(name: 'Six Flags', admission_cost: 75)

      @scrambler = @six_flags.rides.create!(name: 'The Scrambler', thrill_rating: 4, open: true)
      @carousel = @six_flags.rides.create!(name: 'Carousel', thrill_rating: 1, open: true)
      @hurler = @six_flags.rides.create!(name: 'The Hurler', thrill_rating: 7, open: true)

      expect(Ride.average_thrill).to eq(4)

    end
  end
end
