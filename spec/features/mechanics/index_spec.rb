require 'rails_helper'

RSpec.describe 'mechanic index page', type: :feature do 

	before :each do 
		@josh = Mechanic.create!(name: 'Josh', years_experience: 2)
		@sal = Mechanic.create!(name: 'Sal', years_experience: 6)
		@kim = Mechanic.create!(name: 'Kim', years_experience: 10)
		@sayaka = Mechanic.create!(name: 'Sayaka', years_experience: 3)

	end

	it 'shows all mechanics with name and experience' do 
		visit '/mechanics'
		save_and_open_page
		expect(page).to have_content('All Mechanics')
		expect(page).to have_content('Josh')
		expect(page).to have_content('Sal')
		expect(page).to have_content('Kim')
		expect(page).to have_content('Sayaka')
		expect(page).to have_content(6)
		expect(page).to have_content(3)
		expect(page).to have_content(10)
		expect(page).to have_content(2)
		
	end



	it 'shows the everage years of experience of all mechanics' do 
		visit 'mechanics'

		expect(page).to have_content('Average years of experience: 5')
	end









end