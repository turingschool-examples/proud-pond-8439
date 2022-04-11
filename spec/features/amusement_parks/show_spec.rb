require 'rails_helper'

RSpec.describe 'amusement park show' do
  before :each do
    @mechanic_1 = Mechanic.create!(name: "Joey Simpson", years_experience: 5)
    @mechanic_2 = Mechanic.create!(name: "Dolly Jackson", years_experience: 16)
    @mechanic_3 = Mechanic.create!(name: "Mac Berger", years_experience: 12)
    @mechanic_4 = Mechanic.create!(name: "Red Valance", years_experience: 24)
    @six_flags = AmusementPark.create!(name: 'Six Flags', admission_cost: 75)
    @universal = AmusementPark.create!(name: 'Universal', admission_cost: 100)

    @hurler = @six_flags.rides.create!(name: 'The Hurler', thrill_rating: 7, open: true)
    @scrambler = @six_flags.rides.create!(name: 'The Scrambler', thrill_rating: 10, open: true)
    @ferris = @six_flags.rides.create!(name: 'Ferris Wheel', thrill_rating: 7, open: false)
    @gravitron = @six_flags.rides.create!(name: 'Gravitron', thrill_rating: 3, open: true)
  end

  it 'displays park name and admission price' do

    visit "/amusement_parks/#{@six_flags.id}"
    expect(page).to have_content("Six Flags")
    expect(page).to have_content("$75.00")
    expect(page).to have_no_content("Universal")
  end

end
