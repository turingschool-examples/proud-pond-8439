require 'rails_helper'

RSpec.describe 'mechanics index page' do
  it 'lists all the mechanics, years of experience and avg yrs experience' do
    mechanic1 = Mechanic.create!(name: "Jolene Jenkins", years_experience: 14)
    mechanic2 = Mechanic.create!(name: "Legolas Smith", years_experience: 8)
    mechanic3 = Mechanic.create!(name: "Hermione Baggins", years_experience: 7)
    mechanic4 = Mechanic.create!(name: "Katniss Skywalker", years_experience: 12)
    mechanic5 = Mechanic.create!(name: "Cersei Malfoy", years_experience: 8)

    visit "/mechanics"
    expect(page).to have_content("All Mechanics")

    Mechanic.all.each do |mechanic|
      expect(page).to have_content(mechanic.name)
      expect(page).to have_content(mechanic.years_experience)
    end

    expect(page).to have_content("Average years experience: 9.8")
    expect(page).not_to have_content("Average years experience: 9.80")
  end
end
