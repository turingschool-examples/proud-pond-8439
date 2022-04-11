require 'rails_helper'

RSpec.describe Mechanic do
  before do
    @mechanic1 = Mechanic.create!(name: "Carny1", years_experience: 10)
    @mechanic2 = Mechanic.create!(name: "Carny2", years_experience: 20)
    @mechanic3 = Mechanic.create!(name: "Carny3", years_experience: 30)
    @amusementpark1 = AmusementPark.create!(name: "7 Flags", admission_cost: 132)
    @ride1 = @mechanic1.rides.create!(name: "Sudden Death", thrill_rating: 9, open: true, amusement_park_id: @amusementpark1.id)
    @ride2 = @mechanic1.rides.create!(name: "The Strong Arm", thrill_rating: 8, open: true, amusement_park_id: @amusementpark1.id)
    @ride3 = @mechanic2.rides.create!(name: "Herpetic Ball Pit", thrill_rating: 10, open: false, amusement_park_id: @amusementpark1.id)
    @ride4 = @mechanic3.rides.create!(name: "Hall of Broken Mirror", thrill_rating: 8, open: false, amusement_park_id: @amusementpark1.id)
  end


  describe 'relationships' do
    it {should have_many :mechanic_rides}
    it {should have_many :rides,through: :mechanic_rides}
    # it {should have_many(:mechanic_rides)}


    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:years_experience)}
  end

  describe 'mechanic index page' do
    it 'has header All Mechanics' do
      visit "/mechanics/index.html.erb"
      expect(page).to have_content("All Mechanics")
    end

    it 'has a list of all mechanics names with years exp' do
      visit "/mechanics/index.html.erb"
        mechanics = Mechanic.all
        mechanics.each do |mechanic|
          expect(page).to have_content(mechanic.name)
          expect(page).to have_content(mechanic.years_experence)
        end
    end

    it 'shows average years exp of all mechanics' do
      visit "/mechanics/index.html.erb"
      expect(Mechanic.ave_years_experience).to eq()
    end
  end

end
