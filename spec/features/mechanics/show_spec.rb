require 'rails_helper'

RSpec.describe "mechanics show page" do
  before :each do
    @amusement_park = AmusementPark.create!(name: "Ferret Land", admission_cost: 100)

    @mechanic1 = Mechanic.create!(name: "Pabu", years_experience: 4)
    @mechanic2 = Mechanic.create!(name: "Thor", years_experience: 2)
    @mechanic3 = Mechanic.create!(name: "Loki", years_experience: 6)

    @ride1 = Ride.create!(amusement_park_id: @amusement_park.id, name: "Water slide", thrill_rating: 5, open: true)
    @ride2 = Ride.create!(amusement_park_id: @amusement_park.id, name: "Tube coaster", thrill_rating: 10, open: true)
    @ride3 = Ride.create!(amusement_park_id: @amusement_park.id, name: "Spinning cups", thrill_rating: 2, open: false)
    @ride4 = Ride.create!(id: 4, amusement_park_id: @amusement_park.id, name: "Tower drop", thrill_rating: 8, open: true)

    MechanicRide.create!(ride_id: @ride1.id, mechanic_id: @mechanic1.id)
    MechanicRide.create!(ride_id: @ride2.id, mechanic_id: @mechanic1.id)
    MechanicRide.create!(ride_id: @ride3.id, mechanic_id: @mechanic1.id)

    visit "mechanics/#{@mechanic1.id}"
  end
  describe "User story 2" do
    it "has header" do
      expect(page).to have_content("#{@mechanic1.name}")
    end
    it "shows mechanic attributes" do
      within("#mechanic") do
        expect(page).to have_content("#{@mechanic1.years_experience}")
        expect(page).to_not have_content("#{@mechanic2.name}")
        expect(page).to_not have_content("#{@mechanic2.years_experience}")
        expect(page).to have_content("#{@ride1.name}")
        expect(page).to have_content("#{@ride2.name}")
        expect(page).to have_content("#{@ride3.name}")
      end
    end
    it "shows open rides in thrill rating order" do
      within("#open-rides") do
        expect(page).to have_content("#{@ride1.name}")
        expect(page).to have_content("#{@ride2.name}")
        expect(page).to_not have_content("#{@ride3.name}")
      end
    end
  end

  describe "User story 3" do
    xit "has form to add ride" do
      within("#add-ride") do
        expect(page).to have_content("Add ride to workload:")

        fill_in "Ride", with: "4"
        click_button "Submit"

        expect(current_path).to eq("/mechanics/#{@mechanic1.id}")
      end
      within("#mechanic") do
        expect(page).to have_content("#{@ride4.name}")
      end
    end
  end
end
