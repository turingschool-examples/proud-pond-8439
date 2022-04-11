require "rails_helper"
RSpec.describe 'Mechanic Show' do
  it "shows mechanic info" do
    @six_flags = AmusementPark.create!(name: 'Six Flags', admission_cost: 75)
    @mech1 = Mechanic.create!(name: "Jeff", years_experience: 7)
    @ride1 = @six_flags.rides.create!(name: 'The Hurler', thrill_rating: 7, open: true)
    @ride2 = @six_flags.rides.create!(name: 'The Scrambler', thrill_rating: 4, open: true)
    @ride3 = @six_flags.rides.create!(name: 'Ferris Wheel', thrill_rating: 7, open: false)
    RideMechanic.create!(ride_id: @ride1.id, mechanic_id: @mech1.id)
    RideMechanic.create!(ride_id: @ride2.id, mechanic_id: @mech1.id)
    RideMechanic.create!(ride_id: @ride3.id, mechanic_id: @mech1.id)
    visit "/mechanic/#{mech1.id}"
    
  end
end
