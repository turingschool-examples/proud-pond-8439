require 'rails_helper'

RSpec.describe 'mechanics index page' do
  describe 'as a user' do
    describe 'when i visit the mechanics index page' do
      before :each do
        @mechanic_1 = Mechanic.create!(name: "James", years_experience: 20)
        @mechanic_2 = Mechanic.create!(name: "Ian", years_experience: 19)
        @mechanic_3 = Mechanic.create!(name: "Tom", years_experience: 22)
      end

      it 'i see a header saying all mechanics' do
        visit "/mechanics"

        expect(page).to have_content("All Mechanics")
      end

      it 'and i see a list of all mechanics names and their years of experience' do
        visit "/mechanics"

        expect(page).to have_content("#{@mechanic_1.name}")
        expect(page).to have_content("Years of Experience: #{@mechanic_1.years_experience}")
        expect(page).to have_content("#{@mechanic_2.name}")
        expect(page).to have_content("Years of Experience: #{@mechanic_2.years_experience}")
        expect(page).to have_content("#{@mechanic_3.name}")
        expect(page).to have_content("Years of Experience: #{@mechanic_3.years_experience}")
      end

      it 'and i see the average years of experience across all mechanics' do
        visit "/mechanics"

        expect(page).to have_content("Average Years of Experience for All Mechanics: 20.33")
      end
    end
  end
end
