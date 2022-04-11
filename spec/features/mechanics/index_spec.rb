require 'rails_helper'

describe 'Mechanics index page' do
  before do
    mech_1 = Mechanic.create!(
      name: 'John Mulany',
      years_experience: 25
    )
    mech_2 = Mechanic.create!(
      name: 'Jane Bologni',
      years_experience: 45
    )

    visit "/mechanics/"
  end

  it 'displays mechanics names and ages' do
    expect(page).to have_content("All Mechanics")
    within("#mechanic-#{mech_1.id}") do
      expect(page).to have_content("John Mulany")
      expect(page).to have_content("25")
    end
    within("#mechanic-#{mech_2.id}") do
      expect(page).to have_content("Jane Bologni")
      expect(page).to have_content("45")
    end
  end
end
