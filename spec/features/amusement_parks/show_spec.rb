require 'rails_helper'

RSpec.describe "Amusement Park show page" do
  before (:each) do
    @six_flags = AmusementPark.create!(name: 'Six Flags', admission_cost: 75)

    @scrambler = @six_flags.rides.create!(name: 'The Scrambler', thrill_rating: 4, open: true)
    @carousel = @six_flags.rides.create!(name: 'Carousel', thrill_rating: 1, open: true)
    @hurler = @six_flags.rides.create!(name: 'The Hurler', thrill_rating: 7, open: true)
    @ferris = @six_flags.rides.create!(name: 'Ferris Wheel', thrill_rating: 7, open: false)
    @mine_shaft = @six_flags.rides.create!(name: 'Mine Shaft', thrill_rating: 6, open: true)
  end

  describe "when I visit the show page" do
    it "displays the name and price" do
      visit "/amusement_parks/#{@six_flags.id}"

      expect(page).to have_content("Six Flags")
      expect(page).to have_content("$75.00")
    end

    it "lists the rides in alpha order" do
      visit "/amusement_parks/#{@six_flags.id}"

      within('#rides') do
        expect("Carousel").to appear_before("Ferris Wheel")
        expect("Ferris Wheel").to appear_before("Mine Shaft")
        expect("Mine Shaft").to appear_before("The Hurler")
        expect("The Hurler").to appear_before("The Scrambler")
      end
    end

    it "displays the average thrill rating" do
      visit "/amusement_parks/#{@six_flags.id}"

      expect(page).to have_content("Average Thrill Rating of Rides")
      expect(page).to have_content("5.0")
    end
  end
end
