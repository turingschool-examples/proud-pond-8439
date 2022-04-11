require 'rails_helper'

RSpec.describe 'Mechanics show page' do
  before do
    @mech_1 = Mechanic.create!(name: 'John', years_of_experience: 8)
    @mech_2 = Mechanic.create!(name: 'Michelle', years_of_experience: 14)
    @mech_4 = Mechanic.create!(name: 'Mike', years_of_experience: 6)
    @mech_3 = Mechanic.create!(name: 'Sarah', years_of_experience: 12)

    @park_1 = AmusementPark.create!(name: 'Big Sur', admission_cost: 3400)
    @park_3 = AmusementPark.create!(name: 'Bedrock', admission_cost: 2600)
    @park_2 = AmusementPark.create!(name: 'Amazement', admission_cost: 4200)

    @ride_1 = @park_2.rides.create!(name: 'gigantor', thrill_rating: 8, open: true)
    @ride_2 = @park_1.rides.create!(name: 'ultra', thrill_rating: 6, open: false)
    @ride_3 = @park_1.rides.create!(name: 'max', thrill_rating: 8, open: true)
    @ride_4 = @park_3.rides.create!(name: 'venti', thrill_rating: 4, open: true)
    @ride_5 = @park_1.rides.create!(name: 'terrify', thrill_rating: 10, open: false)
    @ride_6 = @park_2.rides.create!(name: 'scary', thrill_rating: 6, open: true)
    @ride_7 = @park_3.rides.create!(name: 'yikes', thrill_rating: 10, open: true)

    @mr_1 = MechanicRide.create!(mechanic: @mech_2, ride: @ride_7)
    @mr_2 = MechanicRide.create!(mechanic: @mech_2, ride: @ride_2)
    @mr_3 = MechanicRide.create!(mechanic: @mech_2, ride: @ride_4)
    @mr_4 = MechanicRide.create!(mechanic: @mech_1, ride: @ride_6)


    visit "/mechanics/#{@mech_2.id}"
  end
  describe 'As user when I visit a mechanic show page' do
    it 'I see their name, years of experience, and the names of rides they’re working on' do
      expect(page).to have_content("Michelle")
      expect(page).to have_content("14")
      expect(page).to have_content("#{@ride_7.name}")
      expect(page).to have_content("#{@ride_4.name}")
    end
  end
end