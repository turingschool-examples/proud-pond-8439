require 'rails_helper'

RSpec.describe 'amusement_parks show page', type: :feature do 

	before :each do 
		@six_flags = AmusementPark.create!(name: 'Six Flags', admission_cost: 75)
		scrambler = @six_flags.rides.create!(name: 'The Scrambler', thrill_rating: 4, open: true)
		ferris = @six_flags.rides.create!(name: 'Ferris Wheel', thrill_rating: 6, open: true)
		hurler = @six_flags.rides.create!(name: 'The Hurler', thrill_rating: 7, open: true)
	end

	it 'shows info for AMUSEMENT PARKS and rides their rides alphabetically' do 
		visit "/amusement_parks/#{@six_flags.id}"

		within('#park_info') do 
			expect(page).to have_content('Six Flags')
			expect(page).to have_content('$75.00')
		end

		within('#rides_info') do 
			expect('Ferris Wheel').to appear_before('The Hurler')
			expect('The Hurler').to appear_before('The Scrambler')
		end
	end

	it 'shows the average thrill_rating of all rides in a park' do 
		visit "/amusement_parks/#{@six_flags.id}"
		
		expect(page).to have_content('5.7')			
	end
end

	