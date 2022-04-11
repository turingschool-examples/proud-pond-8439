require 'rails_helper'

RSpec.describe Mechanic do
  describe 'relationships' do
    it {should belong_to(:ride)}
    # it {should have_many(:rides)}
    # it {should have_many(:amusement_parks), through: :ride}

    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:years_experience)}
  end

  describe 'mechanic index page' do
    it 'has header All Mechanics' do
      visit "/mechanics/index.html.erb"
      expect(page).to have_content("All Mechanics")
    end

    it 'has a list of all mechanics names with years exp' do
      visit "mechanics/index.html.erb"
        mechanics = Mechanic.all
        mechanics.each do |mechanic|
          expect(page).to have_content(mechanic.name)
          expect(page).to have_content(mechanic.years_experence)
        end
    end

    it 'shows average years exp of all mechanics' do
      visit "mechanics/index.html.erb"
      expect(page).to have_content(Mechanic.ave_years_experience)
    end
  end

end
