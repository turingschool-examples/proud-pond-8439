require 'rails_helper'

describe 'Mechanics show page' do
  before do
    @mech_1 = Mechanic.create!(
      name: 'John Mulany',
      years_experience: 25
    )
    @mech_2 = Mechanic.create!(
      name: 'Jane Bologni',
      years_experience: 45
    )

    @amusement_park_1 = AmusementPark.create!(
      name: "Lincoln Log Land",
      admission_cost: 658
    )

    @ride_1 = @amusement_park_1.rides.create!(
      name: "Actual Log Cabin",
      thrill_rating: 1,
      open: true
    )
    @ride_2 = @amusement_park_1.rides.create!(
      name: "Lincoln Log Slide",
      thrill_rating: 4,
      open: true
    )
    @ride_3 = @amusement_park_1.rides.create!(
      name: "Space Log Roller Coaster",
      thrill_rating: 9,
      open: false
    )
    @ride_4 = @amusement_park_1.rides.create!(
      name: "Kiddy Log Jump",
      thrill_rating: 10,
      open: true
    )

    RideMechanic.create!(mechanic_id: @mech_1.id, ride_id:@ride_1.id)
    RideMechanic.create!(mechanic_id: @mech_1.id, ride_id:@ride_2.id)
    RideMechanic.create!(mechanic_id: @mech_1.id, ride_id:@ride_3.id)

    RideMechanic.create!(mechanic_id: @mech_2.id, ride_id:@ride_4.id)

    visit "/mechanics/#{@mech_1.id}"
  end

  it 'displays mechanics names and ages' do
    expect(page).to have_content("John Mulany")
    expect(page).to have_content("25")
    expect(page).not_to have_content("Jane Bologni")
  end

  it 'displays the names of the rides the mechanic is working on' do
    within('#rides') do
      expect(page).to have_content("Lincoln Log Slide")
      expect(page).to have_content("Actual Log Cabin")
      expect(page).not_to have_content("Kiddy Log Jump")
    end
  end

  it 'does not display closed rides' do
    within('#rides') do
      expect(page).to have_content("Lincoln Log Slide")
      expect(page).to have_content("Actual Log Cabin")
      expect(page).not_to have_content("Space Log Roller Coaster")
    end
  end

  it 'sorts rides by thrill rating' do
    within('#rides') do
      expect("Lincoln Log Slide").to appear_before("Actual Log Cabin")
    end
  end

  describe "form to add rides to mech's workload" do
    it 'has a form to add new rides to the mechanincs workload' do
      within('#work_form') do
        expect(page).to have_field("Ride ID")
      end
    end
    it 'allows you to add a ride to a mechanics workload' do
      within('#rides') do
        expect(page).not_to have_content("Kiddy Log Jump")
      end

      within('#work_form') do
        fill_in('Ride ID', with: @ride_4.id)
        click_button("Add this ride to John Mulany's workload")

        expect(current_path).to eq("/mechanics/#{@mech_1.id}")
      end

      within('#rides') do
        expect(page).to have_content("Kiddy Log Jump")
      end
    end
  end
end
