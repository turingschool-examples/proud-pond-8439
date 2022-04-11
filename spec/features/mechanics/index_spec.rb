require 'rails_helper'


RSpec.describe 'Mechanic Index' do
  describe 'header, list of mechanics and informaiton, and avg experience' do
    it 'has a header' do
      mechanic = Mechanic.create!(name: 'George', years_experience: 5)
      mechanic_2 = Mechanic.create!(name: 'Amanda', years_experience: 1)
      mechanic_3 = Mechanic.create!(name: 'Joe', years_experience: 3)
      visit '/mechanics'
      expect(page).to have_content('All Mechanics')
      expect(page).to have_content("#{mechanic.name}")
      expect(page).to have_content("#{mechanic.years_experience}")
      expect(page).to have_content("#{mechanic_2.name}")
      expect(page).to have_content("#{mechanic_2.years_experience}")
      expect(page).to have_content("#{mechanic_3.name}")
      expect(page).to have_content("#{mechanic_3.years_experience}")
      expect(page).to have_content("Average years of expereince: 3")
    end
  end
end
