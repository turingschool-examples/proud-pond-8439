require 'rails_helper'

RSpec.describe 'mechanics index' do

  it "displays all mechanics info and average years experience" do
    mechanic_1 = Mechanic.create!(name: "Bill", years_experience: 12)
    mechanic_2 = Mechanic.create!(name: "Sally", years_experience: 13)
    mechanic_3 = Mechanic.create!(name: "Geoffrey", years_experience: 8)

    visit "/mechanics/"

    expect(page).to have_content(mechanic_1.name)
    expect(page).to have_content(mechanic_3.years_experience)
    expect(page).to have_content(11)
  end

end
