require 'rails_helper'

RSpec.describe 'the mechanic index' do
  it "shows mechanics and their attributes" do
    drew = Mechanic.create!(name:"Drew", years_experience: 1)
    mike = Mechanic.create!(name:"Mike", years_experience: 7)

    visit "/mechanics/"

    expect(page).to have_content(drew.name)
    expect(page).to have_content(drew.years_experience)


  end

    it "shows average years worked of all mechanics" do
      drew = Mechanic.create!(name:"Drew", years_experience: 1)
      mike = Mechanic.create!(name:"Mike", years_experience: 7)

      visit "/mechanics/"
      save_and_open_page
      within('#average') do
      expect(page).to have_content("4")
      end

    end

end
