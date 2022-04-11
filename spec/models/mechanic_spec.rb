require 'rails_helper'

RSpec.describe Mechanic do
  before :each do
    @six_flags = AmusementPark.create!(name: 'Six Flags', admission_cost: 75)
    @universal = AmusementPark.create!(name: 'Universal Studios', admission_cost: 80)

    @hurler = @six_flags.rides.create!(name: 'The Hurler', thrill_rating: 7, open: true)
    @scrambler = @six_flags.rides.create!(name: 'The Scrambler', thrill_rating: 4, open: true)
    @ferris_wheel = @six_flags.rides.create!(name: 'Ferris Wheel', thrill_rating: 7, open: false)

    @jaws = @universal.rides.create!(name: 'Jaws', thrill_rating: 5, open: true)

    @mech_1 = @hurler.mechanics.create!(name: "Billy Bighammer", years_experience: 50)
    @mech_2 = @hurler.mechanics.create!(name: "Linda Licehead", years_experience: 8)
    @mech_3 = @scrambler.mechanics.create!(name: "Rhonda Roundhouse", years_experience: 19)
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

end
