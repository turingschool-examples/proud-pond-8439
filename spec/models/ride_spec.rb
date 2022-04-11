require 'rails_helper'

RSpec.describe Ride do
  describe 'relationships' do
    it { should belong_to(:amusement_park) }
    it { should have_many(:ride_mechanics) }
    it { should have_many(:mechanics).through(:ride_mechanics) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:thrill_rating) }
    it { should allow_value(true).for :open}
    it { should allow_value(false).for :open}
    it { should_not allow_value(nil).for :open}
  end

  describe 'class methods' do
    before (:each) do
      @park = AmusementPark.create!(name: "Westeros World", admission_cost: 105)

      @ride1 = @park.rides.create!(name: "Viscerion's Voyage", thrill_rating: 6, open: false)
      @ride2 = @park.rides.create!(name: "Bran's Fall", thrill_rating: 8, open: true)
      @ride3 = @park.rides.create!(name: "Brianne's Bear", thrill_rating: 9, open: true)
      @ride4 = @park.rides.create!(name: "The Moon Door", thrill_rating: 8, open: true)
    end

    it '#alpha_order' do
      expect(Ride.alpha_order).to eq([@ride2, @ride3, @ride4, @ride1])
    end

    it '#avg_thrill' do
      expect(Ride.avg_thrill).to eq(7.75)
      expect(Ride.avg_thrill).not_to eq(7.8)
    end
  end
end
