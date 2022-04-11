require 'rails_helper'

RSpec.describe Mechanic, type: :model do

  describe 'relationships' do

    it { should have_many :mechanic_rides }
    it { should have_many(:rides).through(:mechanic_rides)}

  end

  describe 'methods' do
    before do
      #parks
      @six_flags = AmusementPark.create!(name: 'Six Flags', admission_cost: 75)
      @universal = AmusementPark.create!(name: 'Universal Studios', admission_cost: 80)
      #six flags rides
      @hurler = @six_flags.rides.create!(name: 'The Hurler', thrill_rating: 7, open: true)
      @scrambler = @six_flags.rides.create!(name: 'The Scrambler', thrill_rating: 4, open: true)
      @wheel = @six_flags.rides.create!(name: 'Ferris Wheel', thrill_rating: 7, open: false)
      #universals rides
      @jaws = @universal.rides.create!(name: 'Jaws', thrill_rating: 5, open: true)
      @cups = @universal.rides.create!(name: 'Tee Cups', thrill_rating: 9, open: true)
      @twister = @universal.rides.create!(name: 'Mister Twister', thrill_rating: 7, open: false)
      @eraser = @universal.rides.create!(name: 'Mind Eraser', thrill_rating: 8, open: true)
      #mechs
      @bob = Mechanic.create!(name: 'bob', years_experience: 15)
      @joe = Mechanic.create!(name: 'joe', years_experience: 8)
      @skeeter = Mechanic.create!(name: 'skeeter', years_experience: 4)
      @chad = Mechanic.create!(name: 'chad', years_experience: 26)
      #mech rides
      @skeeter4 = MechanicRide.create!(ride: @scrambler, mechanic: @skeeter)
      @skeeter2 = MechanicRide.create!(ride: @hurler, mechanic: @skeeter)
      @skeeter3 = MechanicRide.create!(ride: @twister, mechanic: @skeeter)
      @skeeter1 = MechanicRide.create!(ride: @cups, mechanic: @skeeter)
      @joe1 = MechanicRide.create!(ride: @eraser, mechanic: @joe)
      @joe2 = MechanicRide.create!(ride: @cups, mechanic: @joe)
      @joe3 = MechanicRide.create!(ride: @twister, mechanic: @joe)
      @joe4 = MechanicRide.create!(ride: @wheel, mechanic: @joe)

    end

    it 'retruns the average experience of all mechanics' do
      expect(Mechanic.all_average_exp).to eq(13.25)
    end

    it 'returns a mechanics current rides that are open, by thrill rate DESC' do
      expect(@skeeter.open_rides_desc).to eq([@cups, @hurler, @scrambler])
      expect(@joe.open_rides_desc).to eq([@cups, @eraser])

    end




  end




end
