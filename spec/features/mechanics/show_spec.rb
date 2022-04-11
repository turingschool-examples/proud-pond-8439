require 'rails_helper'

RSpec.describe "Mechanics show page" do
  before (:each) do
    @kara = Mechanic.create!(name: "Kara Smith", years_experience: 11)
    @dixie = Mechanic.create!(name: "Dixie Kong", years_experience: 3)

    @six_flags = AmusementPark.create!(name: 'Six Flags', admission_cost: 75)

    @scrambler = @six_flags.rides.create!(name: 'The Scrambler', thrill_rating: 4, open: true)
    @carousel = @six_flags.rides.create!(name: 'Carousel', thrill_rating: 1, open: true)
    @hurler = @six_flags.rides.create!(name: 'The Hurler', thrill_rating: 7, open: true)
    @ferris = @six_flags.rides.create!(name: 'Ferris Wheel', thrill_rating: 7, open: false)
    @mine_shaft = @six_flags.rides.create!(name: 'Mine Shaft', thrill_rating: 6, open: true)


    RideMechanic.create!(mechanic_id: @kara.id, ride_id: @hurler.id)
    RideMechanic.create!(mechanic_id: @kara.id, ride_id: @scrambler.id)
    RideMechanic.create!(mechanic_id: @kara.id, ride_id: @ferris.id)
    RideMechanic.create!(mechanic_id: @kara.id, ride_id: @carousel.id)
    RideMechanic.create!(mechanic_id: @dixie.id, ride_id: @hurler.id)

  end

  describe "when I visit a mechanic show page" do
    it "displays their attributes" do
      visit "/mechanics/#{@kara.id}"

      expect(page).to have_content("Kara Smith")
      expect(page).to have_content("11")
      expect(page).to_not have_content("Dixie Kong")
    end

    it "displays rides they are working on" do
      visit "/mechanics/#{@kara.id}"

      within('#ride') do
        expect(page).to have_content("The Hurler")
        expect(page).to have_content("The Scrambler")
      end
    end

    it "displays only open rides" do
      visit "/mechanics/#{@kara.id}"

      within('#ride') do
        expect(page).to have_content("The Hurler")
        expect(page).to_not have_content("Ferris Wheel")
      end
    end

    it "displays rides in thrill descending order" do
      visit "/mechanics/#{@kara.id}"

      expect("The Hurler").to appear_before("The Scrambler")
      expect("The Scrambler").to appear_before("Carousel")
    end

    it "allows user to add to their workload" do
      visit "/mechanics/#{@kara.id}"

      expect(page).to have_content("Add a ride to workload")

      fill_in("ride", with: "#{@mine_shaft.id}")
      click_on "Submit"
      expect(current_path).to eq("/mechanics/#{@kara.id}")

      expect(page).to have_content("Mine Shaft")
    end
  end
end
