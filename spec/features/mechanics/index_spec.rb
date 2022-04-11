require 'rails_helper'

RSpec.describe 'Mechanic Index Page' do
  before do
    @mech_1 = Mechanic.create!(name: 'John', years_of_experience: 8)
    @mech_2 = Mechanic.create!(name: 'Michelle', years_of_experience: 14)
    @mech_4 = Mechanic.create!(name: 'Mike', years_of_experience: 6)
    @mech_3 = Mechanic.create!(name: 'Sarah', years_of_experience: 12)

    visit '/mechanics'
  end

  describe 'As User, when I visit the mechanics index page' do
    it 'I see a header saying All Mechanics' do
      expect(page).to have_content("All Mechanics")
    end

    it 'I see a list of all of the mechanics with their attributes' do
      expect(page).to have_content("John")
      expect(page).to have_content("8")
      expect(page).to have_content("Michelle")
      expect(page).to have_content("14")
      expect(page).to have_content("Mike")
      expect(page).to have_content("6")
      expect(page).to have_content("Sarah")
      expect(page).to have_content("12")
      expect(page).to have_content("average years:10")
    end
  end
end