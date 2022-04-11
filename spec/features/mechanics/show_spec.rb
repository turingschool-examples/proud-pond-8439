# Story 2 - Mechanic Show Page
#
# As a user,
# When I visit a mechanic show page
# I see their name, years of experience, and the names of rides they’re working on
# And I only see rides that are open
# And the rides are listed by thrill rating in descending order (most thrills first)

require 'rails_helper'

RSpec.describe 'the merchant show page' do
  before :each do
    @will = Mechanic.create!(name: 'Will', years_experience: 7)
    # @twister = @will.rides.create!(name: 'Twister', thrill_rating: 6, open:true)
  end

  it "can display the mechant show page" do
    visit "/mechanics/#{@will.id}"

    expect(current_path).to eq("/mechanics/#{@will.id}")

    within '#header' do
      expect(page).to have_content("Merchant Show Page")
    end
  end

  it 'displays the merchant info' do
    visit "/mechanics/#{@will.id}"

    expect(page).to have_content('Name: Will')
    expect(page).to have_content('Years of Experience: 7')
    expect(page).to have_content('Rides Currently Working On:')
  end

  xit 'lists the rides in desc order most thrills first' do
    visit "/mechanics/#{@will.id}"
  end

  it 'has a form to add a ride to workload'

  it 'allows you to give the id of an existing ride to add'

  it 'takes you back to the mechanic show page after hitting submit'

  it 'displays the newly added ride'
  
end
