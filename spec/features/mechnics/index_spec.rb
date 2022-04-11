require 'rails_helper'

RSpec.describe 'mechanics index' do
  before :each do
    @mechanic_1 = Mechanic.create!(name: "Joey Simpson", years_experience: 5)
    @mechanic_2 = Mechanic.create!(name: "Dolly Jackson", years_experience: 16)
    @mechanic_3 = Mechanic.create!(name: "Mac Berger", years_experience: 12)
    @mechanic_4 = Mechanic.create!(name: "Red Valance", years_experience: 24)
  end
  
  it 'header' do
    visit '/mechanics'
    within '.header' do
      expect(page).to have_content("All Mechanics")
    end
  end
end
