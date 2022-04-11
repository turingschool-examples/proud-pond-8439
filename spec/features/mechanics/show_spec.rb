require 'rails_helper'

describe 'Merchants Show Page' , type: :feature do
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

  end

  describe 'display' do
    it 'shows all attributes' do
      visit "/mechanics/#{@mechanic2.id}"

      within "#mechanic-#{@mechanic2.id}" do
        expect(page).to have_content(@mechanic2.name)
        expect(page).to have_content(@mechanic2.years_of_experience)
        expect(page).to_not have_content(@mechanic3.name)
      end

      visit "/mechanics/#{@mechanic3.id}"
      within "#mechanic-#{@mechanic3.id}" do
        expect(page).to have_content(@mechanic3.name)
        expect(page).to have_content(@mechanic3.years_of_experience)
        expect(page).to_not have_content(@mechanic1.name)
      end
    end
  end
end