require 'rails_helper'

RSpec.describe AmusementPark do
  before do
    @mechanic1 = Mechanic.create!(name: "Carny1", years_experience: 10)
    @mechanic2 = Mechanic.create!(name: "Carny2", years_experience: 20)
    @mechanic3 = Mechanic.create!(name: "Carny3", years_experience: 30)
    @amusementpark1 = AmusementPark.create!(name: "7 Flags", admission_cost: 132)
    @ride1 = @mechanic1.rides.create!(name: "Sudden Death", thrill_rating: 9, open: true, amusement_park_id: @amusementpark1.id)
    @ride2 = @mechanic1.rides.create!(name: "The Strong Arm", thrill_rating: 8, open: true, amusement_park_id: @amusementpark1.id)
    @ride3 = @mechanic2.rides.create!(name: "Herpetic Ball Pit", thrill_rating: 10, open: false, amusement_park_id: @amusementpark1.id)
    @ride4 = @mechanic3.rides.create!(name: "Hall of Broken Mirrors", thrill_rating: 8, open: false, amusement_park_id: @amusementpark1.id)
  end

  describe 'relationships' do
    it { should have_many(:rides) }
    it { should validate_presence_of(:name)}
    it { should validate_presence_of(:admission_cost)}
  end
end
