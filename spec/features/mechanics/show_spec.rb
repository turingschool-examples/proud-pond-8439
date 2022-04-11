require 'rails_helper'

RSpec.describe 'mechanic show page' do
  before :each do
    @park1 = AmusementPark.create!(name: "Wild Adventures", admission_cost: 20)
    @park2 = AmusementPark.create!(name: "Six Flags", admission_cost: 30)
    @ride1 = @park1.rides.create!(name: "Boomerang", thrill_rating: 10, open: true)
    @ride2 = @park1.rides.create!(name: "Shotgun", thrill_rating: 9, open: false)
    @ride3 = @park2.rides.create!(name: "Kite", thrill_rating: 5, open: true)
    @mech1 = Mechanic.create!(name: "Cory", years_experience: 10)
    @mech2 = Mechanic.create!(name: "Kim", years_experience: 10)
    @mech3 = Mechanic.create!(name: "Susan", years_experience: 20)
    @mech4 = Mechanic.create!(name: "Alicia", years_experience: 20)
    @rm1 = RideMechanic.create!(ride_id: @ride1.id, mechanic_id: @mech1.id)
    @rm2 = RideMechanic.create!(ride_id: @ride2.id, mechanic_id: @mech1.id)
    @rm3 = RideMechanic.create!(ride_id: @ride3.id, mechanic_id: @mech1.id)
  end


  it "has a header" do
    visit "/mechanics/#{@mech1.id}"

    expect(page).to have_content(@mech1.name)
    expect(page).to have_content(@mech1.years_experience)
    expect(page).to have_content(@ride1.name)
    expect(page).to have_content(@ride3.name)
    expect(page).to have_no_content(@mech2.name)
    expect(page).to have_no_content(@mech3.name)
    expect(page).to have_no_content(@ride2.name)
  end

end
