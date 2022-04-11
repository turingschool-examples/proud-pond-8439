require 'rails_helper'

RSpec.describe Mechanic do
  before :each do
    @six_flags = AmusementPark.create!(name: 'Six Flags', admission_cost: 75)
    @universal = AmusementPark.create!(name: 'Universal Studios', admission_cost: 80)

    @hurler = @six_flags.rides.create!(name: 'The Hurler', thrill_rating: 7, open: true)
    @scrambler = @six_flags.rides.create!(name: 'The Scrambler', thrill_rating: 4, open: true)
    @ferris_wheel = @six_flags.rides.create!(name: 'Ferris Wheel', thrill_rating: 7, open: false)

    @jaws = @universal.rides.create!(name: 'Jaws', thrill_rating: 5, open: true)

    @mech_1 = Mechanic.create!(name: "Billy Bighammer", years_experience: 50)
    @mech_2 = Mechanic.create!(name: "Linda Licehead", years_experience: 8)
    @mech_3 = Mechanic.create!(name: "Rhonda Roundhouse", years_experience: 19)

    @hurler.mechanics << @mech_1
    @scrambler.mechanics << @mech_1
    @ferris_wheel.mechanics << @mech_1
    
    @hurler.mechanics << @mech_2
    @scrambler.mechanics << @mech_2
  end

  describe "relationships" do
    it {should have_many(:mechanic_rides)}
    it {should have_many(:rides)}
  end

  describe "class methods" do
    it "finds average age of all mechanics" do
      expect(Mechanic.avg_years_experience.round(1).to_f).to eq(25.7)
    end
  end

  describe "instance methods" do
    it "finds all open rides a mechanic is working on" do
      expect(@mech_1.all_rides).to eq([@hurler, @scrambler])
    end
  end

end
