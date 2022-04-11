require 'rails_helper'

describe 'Merchants index' , type: :feature do
  before do
    @mechanic1 = Mechanic.create!(name: 'Sherman', years_of_experience: 3)
    @mechanic3 = Mechanic.create!(name: 'Scott', years_of_experience: 16)
    @mechanic2 = Mechanic.create!(name: 'Susan', years_of_experience: 6)

    @six_flags = AmusementPark.create!(name: 'Six Flags', admission_cost: 75)
    @universal = AmusementPark.create!(name: 'Universal Studios', admission_cost: 80)

    @hurler = @six_flags.rides.create!(name: 'The Hurler', thrill_rating: 7, open: true)
    @scrambler = @six_flags.rides.create!(name: 'The Scrambler', thrill_rating: 4, open: true)
    @ferris = @six_flags.rides.create!(name: 'Ferris Wheel', thrill_rating: 7, open: false)

    @jaws = @universal.rides.create!(name: 'Jaws', thrill_rating: 5, open: true)

    visit '/mechanics'
  end

  describe 'display' do
    it "has a header 'All Mechanics'" do
      expect(page).to have_content("All Mechanics")
    end

    it 'lists all mechanics and their years of expereince' do
      save_and_open_page
      within "#mechanic-#{@mechanic2.id}" do
        expect(page).to have_content(@mechanic2.name)
        expect(page).to have_content(@mechanic2.years_of_experience)
      end

      within "#mechanic-#{@mechanic1.id}" do
        expect(page).to have_content(@mechanic1.name)
        expect(page).to have_content(@mechanic1.years_of_experience)
      end

      within "#mechanic-#{@mechanic3.id}" do
        expect(page).to have_content(@mechanic3.name)
        expect(page).to have_content(@mechanic3.years_of_experience)
      end
    end
  end
end