require 'rails_helper'

RSpec.describe 'Mechanics Show page' do
  before do
    @john = Mechanic.create!(name: "John", years_experience:1)
    @six_flags = AmusementPark.create!(name: 'Six Flags', admission_cost: 75)

    @hurler = @six_flags.rides.create!(name: 'The Hurler', thrill_rating: 7, open: true)
    @scram = @six_flags.rides.create!(name: 'The Scrambler', thrill_rating: 4, open: true)
    @ferris = @six_flags.rides.create!(name: 'Ferris Wheel', thrill_rating: 7, open: false)
    @water = @six_flags.rides.create!(name: 'Thunder River', thrill_rating: 5, open: true)

    MechanicRide.create!(mechanic:@john, ride:@hurler)
    MechanicRide.create!(mechanic:@john, ride:@scram)
    MechanicRide.create!(mechanic:@john, ride:@ferris)
    MechanicRide.create!(mechanic:@john, ride:@water)

    visit "/mechanics/#{@john.id}"
  end

  it 'displays mechanic attributes and rides they work on' do
 #   save_and_open_page

    expect(page).to have_content(@john.name)
    expect(page).to have_content("Experience: #{@john.years_experience}")
    expect(page).to have_content(@hurler.name)
    expect(page).to have_content(@scram.name)
    expect(page).not_to have_content(@ferris.name)

  end

#
# As a user,
# When I visit a mechanic show page
# I see their name, years of experience, and the names of rides they’re working on
# And I only see rides that are open
# And the rides are listed by thrill rating in descending order (most thrills first)

  it 'displays a form to add a ride to a mechanic' do

#    save_and_open_page
      expect(page).to have_content("Add ride to workload")
      expect(page).to have_button("Add")

      click_button("Add")
#      expect(current_path).to eq("/mechanics")
  end

end
#
# Story 2 - Mechanic Show Page
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
