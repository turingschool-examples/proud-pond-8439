require 'rails_helper'

RSpec.describe 'mechanic show page', type: :feature do 

	before :each do 
		@kim = Mechanic.create!(name: 'Kim', years_experience: 10)
		six_flags = AmusementPark.create!(name: 'Six Flags', admission_cost: 75)
		scrambler = six_flags.rides.create!(name: 'The Scrambler', thrill_rating: 4, open: true)
		ferris = six_flags.rides.create!(name: 'Ferris Wheel', thrill_rating: 6, open: false)
		hurler = six_flags.rides.create!(name: 'The Hurler', thrill_rating: 7, open: true)
	  	kim_fixes_things = MechanicRide.create!(mechanic: @kim, ride: hurler)
      	kim_works_more = MechanicRide.create!(mechanic: @kim, ride: scrambler)
      	kim_fixes_them_all = MechanicRide.create!(mechanic: @kim, ride: ferris)
	end

	it 'shows info for mechanic and open rides they are working on by thrill_rating' do 
		visit "/mechanics/#{@kim.id}"

		within('#mechanic_info') do 
			expect(page).to have_content('Kim')
			expect(page).to have_content(10)
		end

		within('#rides_info') do 
		    expect(page).to have_content('The Hurler')    
			expect(page).to have_content('The Scrambler')		
			expect(page).to_not have_content('Ferris Wheel')
			expect('The Hurler').to appear_before('The Scrambler')
		end
	end

	it 'has a form to add a new ride' do 
	    universal = AmusementPark.create!(name: 'Universal Studios', admission_cost: 80)
	    cups = universal.rides.create!(name: 'Spinning Cups', thrill_rating: 5, open: true)
      	kim_over_time = MechanicRide.create!(mechanic: @kim, ride: cups)

		visit "/mechanics/#{@kim.id}"

		within('#add_ride') do 
			fill_in 'ride_id', with: cups.id
			click_on 'Add Ride'

			expect(current_path).to eq("/mechanics/#{@kim.id}")
		end
		within('#rides_info') do
			expect(page).to have_content('The Hurler')    
			expect(page).to have_content('The Scrambler')		
			expect(page).to have_content('Spinning Cups')
			expect('The Hurler').to appear_before('Spinning Cups')
			expect('Spinning Cups').to appear_before('The Scrambler')
		end
	end
end