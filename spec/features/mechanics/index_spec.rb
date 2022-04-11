require 'rails_helper'

RSpec.describe 'mechanics index page', type: :feature do

  # Story 1 - Mechanic Index Page

  # As a user,
  # When I visit the mechanics index page
  # I see a header saying “All Mechanics”

  # And I see a list of all mechanic’s names and their years of experience

  # And I see the average years of experience across all mechanics

  it 'displays a list of names and years_experienece, and average years_experience' do
    john = Mechanic.create!(name: 'John', years_experience: 5)
    amy = Mechanic.create!(name: 'Amy', years_experience: 3)
    sally = Mechanic.create!(name: 'Sally', years_experience: 2)
    sam = Mechanic.create!(name: 'Sam', years_experience: 10)
    visit '/mechanics'
    # update to within if time
    expect(page).to have_content("All Mechanics")
    expect(page).to have_content("John")
    expect(page).to have_content("5")
    expect(page).to have_content("Amy")
    expect(page).to have_content("3")
    expect(page).to have_content("Sally")
    expect(page).to have_content("2")
    expect(page).to have_content("Sam")
    expect(page).to have_content("10")
    save_and_open_page
    expect(page).to have_content("Average Years of Experience: 5")
  end

  # xit 'displays the average age of experience across all mechanics' do
  #   john = Mechanic.create!(name: 'John', years_experience: 5)
  #   amy = Mechanic.create!(name: 'Amy', years_experience: 5)
  #   sally = Mechanic.create!(name: 'Sally', years_experience: 5)
  #   sam = Mechanic.create!(name: 'Sam', years_experience: 5)
  #   visit '/mechanics'
  #
  # end

end
