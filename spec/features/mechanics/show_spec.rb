require 'rails_helper'

RSpec.describe 'Mechanics Show page' do
  before do
    @john = Mechanic.create!(name: "John", years_experience:1)
    @six_flags = AmusementPark.create!(name: 'Six Flags', admission_cost: 75)

    @hurler = @six_flags.rides.create!(name: 'The Hurler', thrill_rating: 7, open: true)
    @scram = @six_flags.rides.create!(name: 'The Scrambler', thrill_rating: 4, open: true)
    @ferris = @six_flags.rides.create!(name: 'Ferris Wheel', thrill_rating: 7, open: false)

    MechanicRide.create!(mechanic:@john, ride:@hurler)
    MechanicRide.create!(mechanic:@john, ride:@scram)
    MechanicRide.create!(mechanic:@john, ride:@ferris)

    visit "/mechanics/#{@john.id}"
  end

  it 'displays mechanic attributes and rides they work on' do
    save_and_open_page

    expect(page).to have_content(@john.name)
    expect(page).to have_content("Experience: #{@john.years_experience}")
    expect(page).to have_content(@hurler.name)
    expect(page).to have_content(@scram.name)
    expect(page).not_to have_content(@ferris.name)

  end

end
#
# Story 2 - Mechanic Show Page
#
# As a user,
# When I visit a mechanic show page
# I see their name, years of experience, and the names of rides they’re working on
# And I only see rides that are open
# And the rides are listed by thrill rating in descending order (most thrills first)
