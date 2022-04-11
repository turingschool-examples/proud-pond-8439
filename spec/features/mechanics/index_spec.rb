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
  end
end