# Story 1 - Mechanic Index Page
#
# As a user,
# When I visit the mechanics index page
# I see a header saying “All Mechanics”
# And I see a list of all mechanic’s names and their years of experience
# And I see the average years of experience across all mechanics

require 'rails_helper'

RSpec.describe 'the merchant index page' do
  before :each do
    @will = Mechanic.create!(name: 'Will', years_experience: 7)
    @jacob = Mechanic.create!(name: 'Jacob', years_experience: 3)
    @jim = Mechanic.create!(name: 'Jim', years_experience: 5)
  end

  it 'has the header of the mechanics page' do
    visit '/mechanics'

    within '#header' do
      expect(page).to have_content('All Mechanics')
      expect(page).to_not have_content('Will')
      expect(page).to_not have_content('Jacob')
      expect(page).to_not have_content('Jim')
    end
  end

  it 'lists all mechanic names and years of experience' do
    visit '/mechanics'

    within '#index' do
      expect(page).to have_content('Will')
      expect(page).to have_content('Jacob')
      expect(page).to have_content('Jim')
      expect(page).to_not have_content('All Mechanics')
      expect(page).to have_content(7)
      expect(page).to have_content(3)
      expect(page).to have_content(5)
      expect(page).to_not have_content(735)
    end
  end

  it 'shows the average years of experience for all mechanics' do
    visit '/mechanics'

    within '#header' do
      expect(page).to have_content('Average Years of Experience:')
      expect(page).to have_content(5)
    end
  end

end
