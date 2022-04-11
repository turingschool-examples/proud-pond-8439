require "rails_helper"
RSpec.describe 'Mechanic Show' do
  it "shows mechanic info" do
    @six_flags = AmusementPark.create!(name: 'Six Flags', admission_cost: 75)
    @mech1 = Mechanic.create!(name: "Jeff", years_experience: 7)
    @ride2 = @six_flags.rides.create!(name: 'The Scrambler', thrill_rating: 4, open: true)
    @ride1 = @six_flags.rides.create!(name: 'The Hurler', thrill_rating: 7, open: true)
    @ride3 = @six_flags.rides.create!(name: 'Ferris Wheel', thrill_rating: 7, open: false)
    RideMechanic.create!(ride_id: @ride1.id, mechanic_id: @mech1.id)
    RideMechanic.create!(ride_id: @ride2.id, mechanic_id: @mech1.id)
    RideMechanic.create!(ride_id: @ride3.id, mechanic_id: @mech1.id)
    visit "/mechanic/#{@mech1.id}"
    
    expect(page).to have_content("Jeff")
    expect(page).to have_content("The Hurler")
    expect(page).to have_content("The Scrambler")
    expect(page).to_not have_content("Ferris Wheel")
    expect(page.text.index("The Hurler")).to be < (page.text.index("The Scrambler"))
    
  end
  
  it "has a add a ride box" do
    expect(page).to have_content('Add a Ride')
  end
end
