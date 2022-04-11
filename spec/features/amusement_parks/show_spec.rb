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
      visit "/amusementparks/#{@six_flags.id}"

      expect(page).to have_content("Six Flags")
      expect(page).to have_content("$75.00")
    end
  end
end
