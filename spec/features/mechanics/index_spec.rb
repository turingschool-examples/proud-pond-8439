require 'rails_helper'

RSpec.describe 'the mechanics index' do
  it 'displays mechanics: names, and experience' do
    mechanic1 = Mechanic.create!(name: "Jim", experience: 10)
    mechanic2 = Mechanic.create!(name: "Tim", experience: 20)

    visit "/mechanics"

    expect(page).to have_content(mechanic1.name)
    expect(page).to have_content(mechanic1.experience)
    expect(page).to have_content(mechanic2.name)
    expect(page).to have_content(mechanic2.experience)
  end


end
