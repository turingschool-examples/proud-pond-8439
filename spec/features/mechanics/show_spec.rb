require 'rails_helper'

RSpec.describe 'the mechanics show' do
  it 'displays mechanics: names, and experience' do
    mechanic1 = Mechanic.create!(name: "Jim", experience: 10)
    mechanic2 = Mechanic.create!(name: "Tim", experience: 20)
    
    visit "/mechanics/#{mechanic1.id}"

    expect(page).to have_content(mechanic1.name)
    expect(page).to have_content(mechanic1.experience)

  end

end
