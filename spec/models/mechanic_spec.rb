require 'rails_helper'

describe Mechanic do
  describe 'relationships' do
    it {should have_many(:ride_mechanic)}
    it {should have_many(:ride)}
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_numericality_of(:years_experience) }
  end

  before do
    @mech_1 = Mechanic.create!(
      name: 'John Mulany',
      years_experience: 25
    )
    @mech_2 = Mechanic.create!(
      name: 'Jane Bologni',
      years_experience: 45
    )

    @amusement_park_1 = AmusementPark.create!(
      name: "Lincoln Log Land",
      admission_cost: 658
    )

    @ride_1 = @amusement_park_1.rides.create!(
      name: "Actual Log Cabin",
      thrill_rating: 1,
      open: true
    )
    @ride_2 = @amusement_park_1.rides.create!(
      name: "Lincoln Log Slide",
      thrill_rating: 4,
      open: true
    )
    @ride_3 = @amusement_park_1.rides.create!(
      name: "Space Log Roller Coaster",
      thrill_rating: 9,
      open: false
    )
    @ride_4 = @amusement_park_1.rides.create!(
      name: "Kiddy Log Jump",
      thrill_rating: 11,
      open: true
    )

    RideMechanic.create!(mechanic_id: @mech_1.id, ride_id:@ride_1.id)
    RideMechanic.create!(mechanic_id: @mech_1.id, ride_id:@ride_2.id)
    RideMechanic.create!(mechanic_id: @mech_1.id, ride_id:@ride_3.id)

    RideMechanic.create!(mechanic_id: @mech_2.id, ride_id:@ride_4.id)
  end

  describe 'class methods' do
    it 'calculates the average age of all mechanics' do
      expect(Mechanic.average_yoe).to eq(35)
    end
  end

  describe 'instance methods' do
    it 'orders rides by thrill rating' do
      expect(@mech_1.ride).to eq([@ride_1, @ride_2, @ride_3])
      expect(@mech_1.thrill_sort).to eq([@ride_3, @ride_2, @ride_1])
    end
  end
end
