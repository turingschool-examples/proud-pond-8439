require 'rails_helper'

RSpec.describe Mechanic do
  describe 'relationships' do
    it { should have_many(:ride_mechanics) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:years_experience) }
  end

  describe 'class methods' do
    it '#avg_yrs_experience' do
      mechanic2 = Mechanic.create!(name: "Legolas Smith", years_experience: 8)
      mechanic3 = Mechanic.create!(name: "Hermione Baggins", years_experience: 7)
      mechanic4 = Mechanic.create!(name: "Katniss Skywalker", years_experience: 12)
      mechanic5 = Mechanic.create!(name: "Cersei Malfoy", years_experience: 8)

      expect(Mechanic.avg_yrs_experience).to eq(8.75)
      expect(Mechanic.avg_yrs_experience).not_to eq(8.7)
    end
  end

  describe 'instance methods' do
    it '.order_by_thrill' do
      @mechanic1 = Mechanic.create!(name: "Hermione Baggins", years_experience: 7)

      @park = AmusementPark.create!(name: "Westeros World", admission_cost: 105)

      @ride1 = @park.rides.create!(name: "Cruise the Riverlands", thrill_rating: 3, open: true)
      @ride2 = @park.rides.create!(name: "The Night King", thrill_rating: 10, open: true)
      @ride3 = @park.rides.create!(name: "Viscerion's Voyage", thrill_rating: 6, open: false)
      @ride4 = @park.rides.create!(name: "Bran's Fall", thrill_rating: 8, open: true)
      @ride5 = @park.rides.create!(name: "Brianne's Bear", thrill_rating: 9, open: true)

      RideMechanic.create!(ride_id: @ride1.id, mechanic_id: @mechanic1.id)
      RideMechanic.create!(ride_id: @ride2.id, mechanic_id: @mechanic1.id)
      RideMechanic.create!(ride_id: @ride3.id, mechanic_id: @mechanic1.id)
      RideMechanic.create!(ride_id: @ride5.id, mechanic_id: @mechanic1.id)

      expect(@mechanic1.order_by_thrill).to eq([@ride2, @ride5, @ride3, @ride1])
    end
  end

end
