require 'rails_helper'

RSpec.describe 'mechanics show page', type: :feature do
  # Story 2 - Mechanic Show Page
  #
  # As a user,
  # When I visit a mechanic show page
  # I see their name, years of experience, and the names of rides they’re working on
  # And I only see rides that are open
  # And the rides are listed by thrill rating in descending order (most thrills first)

  it 'displays the name, years_experience and rides for mechanic' do
    john = Mechanic.create!(name: 'John', years_experience: 5)
    six_flags = AmusementPark.create!(name: 'Six Flags', admission_cost: 75)
    coaster = john.rides.create!(name: 'Coaster', thrill_rating: 5, open: true, amusement_park_id: six_flags.id)
    water_slide = john.rides.create!(name: 'Water Slide', thrill_rating: 3, open: true, amusement_park_id: six_flags.id)
    tower = john.rides.create!(name: 'Tower', thrill_rating: 1, open: true, amusement_park_id: six_flags.id)
    bungee = john.rides.create!(name: 'Bungee', thrill_rating: 5, open: false, amusement_park_id: six_flags.id)
    visit "/mechanics/#{john.id}"
    expect(page).to have_content("John")
    expect(page).to have_content("5")
    #  order
    expect(page).to have_content("Coaster")
    expect(page).to have_content("Tower")
    expect(page).to have_content("Water Slide")
    save_and_open_page
    expect(page).to_not have_content("Bungee")
  end

end
