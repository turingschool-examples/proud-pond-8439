require 'rails_helper'

RSpec.describe 'mechanics show page', type: :feature do

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
    expect(page).to have_content("Coaster")
    expect(page).to have_content("Tower")
    expect(page).to have_content("Water Slide")
    expect(page).to_not have_content("Bungee")
  end
  #
  # Story 3 - Add a Ride to a Mechanic
  #
  # As a user,
  # When I go to a mechanics show page
  # I see a form to add a ride to their workload
  # When I fill in that field with an id of an existing ride and hit submit
  # I’m taken back to that mechanic's show page
  # And I see the name of that newly added ride on this mechanics show page
  #
  # Ex:
  # Mechanic: Kara Smith
  # Years of Experience: 11
  #
  # Current rides they’re working on:
  # The Frog Hopper
  # Fahrenheit
  # The Kiss Raise
  #
  # Add a ride to workload:
  # Ride Id: _pretend_this_is_a_textfield_
  # Submit
  it 'allows the user to add a ride to a mechanic' do
    john = Mechanic.create!(name: 'John', years_experience: 5)
    six_flags = AmusementPark.create!(name: 'Six Flags', admission_cost: 75)
    coaster = john.rides.create!(name: 'Coaster', thrill_rating: 5, open: true, amusement_park_id: six_flags.id)
    water_slide = john.rides.create!(name: 'Water Slide', thrill_rating: 3, open: true, amusement_park_id: six_flags.id)
    tower = john.rides.create!(name: 'Tower', thrill_rating: 1, open: true, amusement_park_id: six_flags.id)
    bungee = john.rides.create!(name: 'Bungee', thrill_rating: 5, open: false, amusement_park_id: six_flags.id)
    twister = six_flags.rides.create!(name: 'Twister', thrill_rating: 2, open: true)
    visit "/mechanics/#{john.id}"
    fill_in "ride_id", with: twister.id
    click_on "Submit"
    expect(current_path).to eq("/mechanics/#{john.id}")
    expect(page).to have_content("Twister")
  end
end
