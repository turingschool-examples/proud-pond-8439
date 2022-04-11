require 'rails_helper'

RSpec.describe 'mechanics index page', type: :feature do

  it 'displays a list of names and years_experienece, and average years_experience' do
    john = Mechanic.create!(name: 'John', years_experience: 5)
    amy = Mechanic.create!(name: 'Amy', years_experience: 3)
    sally = Mechanic.create!(name: 'Sally', years_experience: 2)
    sam = Mechanic.create!(name: 'Sam', years_experience: 10)
    visit '/mechanics'
    within "#mechanic" do
      expect(page).to have_content("All Mechanics")
    end
    expect(page).to have_content("John")
    expect(page).to have_content("5")
    expect(page).to have_content("Amy")
    expect(page).to have_content("3")
    expect(page).to have_content("Sally")
    expect(page).to have_content("2")
    expect(page).to have_content("Sam")
    expect(page).to have_content("10")
    expect(page).to have_content("Average Years of Experience: 5")
  end

end
