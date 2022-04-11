require 'rails_helper'

RSpec.describe 'mechanics index' do
  before :each do
    # @mechanic_1 = Mechanic.create!(name: "Joey Simpson", years_experience: 5)
    # @mechanic_2 = Mechanic.create!(name: "Dolly Jackson", years_experience: 16)
    # @mechanic_3 = Mechanic.create!(name: "Mac Berger", years_experience: 12)
    # @mechanic_4 = Mechanic.create!(name: "Red Valance", years_experience: 24)
  end

  it 'header' do
    visit '/mechanics'
    within '.header' do
      expect(page).to have_content("All Mechanics")
    end
  end

  it 'displays their name and years_experience' do
    mechanic_1 = Mechanic.create!(name: "Joey Simpson", years_experience: 5)
    mechanic_2 = Mechanic.create!(name: "Dolly Jackson", years_experience: 16)
    mechanic_3 = Mechanic.create!(name: "Mac Berger", years_experience: 12)
    mechanic_4 = Mechanic.create!(name: "Red Valance", years_experience: 24)
    visit '/mechanics'
    # save_and_open_page
    within "#mechanic-#{mechanic_1.id}" do
      expect(page).to have_content("Joey Simpson")
      expect(page).to have_content("5")
      expect(page).to have_no_content("Dolly Jackson")
    end
  end

  it 'displays avg years of experience' do
    mechanic_1 = Mechanic.create!(name: "Joey Simpson", years_experience: 5)
    mechanic_2 = Mechanic.create!(name: "Dolly Jackson", years_experience: 16)
    mechanic_3 = Mechanic.create!(name: "Mac Berger", years_experience: 12)
    mechanic_4 = Mechanic.create!(name: "Red Valance", years_experience: 24)
    visit '/mechanics'
    # save_and_open_page
    expect(page).to have_content("14.25")
  end
end
