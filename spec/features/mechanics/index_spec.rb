require 'rails_helper'

RSpec.describe 'Mechanics index page' do
  before do
    @john = Mechanic.create!(name: "John", years_experience:1)
    @paul = Mechanic.create!(name: "Paul", years_experience:2)
    @george = Mechanic.create!(name: "George", years_experience:3)
    @ringo = Mechanic.create!(name: "Ringo", years_experience:4)
    visit "/mechanics"
  end
  it "lists all machanic's attributes" do

    expect(page).to have_content("All Mechanics")

    expect(page).to have_content(@john.name)
    expect(page).to have_content(@john.years_experience)

    expect(page).to have_content(@paul.name)
    expect(page).to have_content(@paul.years_experience)

    save_and_open_page
#    expect(page).to have_content("Average years of experience")

  end

end
# Story 1 - Mechanic Index Page
#
# As a user,
# When I visit the mechanics index page
# I see a header saying “All Mechanics”
# And I see a list of all mechanic’s names and their years of experience
# And I see the average years of experience across all mechanics
