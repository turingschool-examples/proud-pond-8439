require 'rails_helper'

RSpec.describe 'Mechanics index page' do
  before :each do
    @mechanic_1 = Mechanic.create!(name:'Billy Johnson', years_experience: 8)
    @mechanic_2 = Mechanic.create!(name:'Sam Jones', years_experience: 5)
    @mechanic_3 = Mechanic.create!(name:'Francine Halls', years_experience: 10)

    visit '/mechanics'
  end

  it 'shows all mechanics and attributes' do
    within 'h1' do
      expect(page).to have_content('All Mechanics')
    end

    expect(page).to have_content('Average years of experience: 7.67')

    within "#mechanic-#{@mechanic_1.id}" do
      expect(page).to have_content('Name: Billy Johnson')
      expect(page).to have_content('Years experience: 8')
    end

    within "#mechanic-#{@mechanic_2.id}" do
      expect(page).to have_content('Name: Sam Jones')
      expect(page).to have_content('Years experience: 5')
    end

    within "#mechanic-#{@mechanic_3.id}" do
      expect(page).to have_content('Name: Francine Halls')
      expect(page).to have_content('Years experience: 10')
    end
  end
end
