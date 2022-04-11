require 'rails_helper'

RSpec.describe "Mechanic Show Page" do

  before do
    AmusementPark.destroy_all
    Ride.destroy_all
    Mechanic.destroy_all
    #parks
    @six_flags = AmusementPark.create!(name: 'Six Flags', admission_cost: 75)
    @universal = AmusementPark.create!(name: 'Universal Studios', admission_cost: 80)
    #six flags rides
    @hurler = @six_flags.rides.create!(name: 'The Hurler', thrill_rating: 7, open: true)
    @scrambler = @six_flags.rides.create!(name: 'The Scrambler', thrill_rating: 4, open: true)
    @wheel = @six_flags.rides.create!(name: 'Ferris Wheel', thrill_rating: 7, open: false)
    #universals rides
    @jaws = @universal.rides.create!(name: 'Jaws', thrill_rating: 5, open: true)
    @cups = @universal.rides.create!(name: 'Tee Cups', thrill_rating: 9, open: true)
    @twister = @universal.rides.create!(name: 'Mister Twister', thrill_rating: 7, open: false)
    @eraser = @universal.rides.create!(name: 'Mind Eraser', thrill_rating: 8, open: true)
    #mechanics
    @bob = Mechanic.create!(name: 'bob', years_experience: 15)
    @joe = Mechanic.create!(name: 'joe', years_experience: 8)
    @skeeter = Mechanic.create!(name: 'skeeter', years_experience: 4)
    @chad = Mechanic.create!(name: 'chad', years_experience: 26)
    #bob rides
    @bob1 = MechanicRide.create!(ride: @hurler, mechanic: @bob)
    @bob2 = MechanicRide.create!(ride: @eraser, mechanic: @bob)
    #joe rides
    @joe1 = MechanicRide.create!(ride: @eraser, mechanic: @joe)
    @joe2 = MechanicRide.create!(ride: @cups, mechanic: @joe)
    #skeeeter rides
    @skeeter1 = MechanicRide.create!(ride: @cups, mechanic: @skeeter)
    @skeeter2 = MechanicRide.create!(ride: @hurler, mechanic: @skeeter)
    @skeeter3 = MechanicRide.create!(ride: @twister, mechanic: @skeeter)
    @skeeter4 = MechanicRide.create!(ride: @scrambler, mechanic: @skeeter)
    #chad rides
    @chad1 = MechanicRide.create!(ride: @jaws, mechanic: @chad)
    @chad2 = MechanicRide.create!(ride: @hurler, mechanic: @chad)
    @chad3 = MechanicRide.create!(ride: @eraser, mechanic: @chad)
  end

  describe 'As a visitor' do

    it 'i see a mechanics attributes, names of rides they are working on (only if they are open), ordered by thrill rating' do

      visit "/mechanics/#{@skeeter.id}"
      # save_and_open_page
      expect(page).to have_content("Name: skeeter")
      expect(page).to have_content("Experience: 4")

      within "#rides-#{@cups.id}" do
        expect(page).to_not have_content("#{@scrambler.name}")
        expect(page).to have_content("Name: Tee Cups")
        expect(page).to have_content("Thrill Rating: 9")
      end

      within "#rides-#{@hurler.id}" do
        expect(page).to_not have_content("#{@cups.name}")
        expect(page).to have_content("Name: The Hurler")
        expect(page).to have_content("Thrill Rating: 7")
      end

      within "#rides-#{@scrambler.id}" do
        expect(page).to_not have_content("#{@twister.name}")
        expect(page).to have_content("Name: The Scrambler")
        expect(page).to have_content("Thrill Rating: 4")
      end

      expect(page).to_not have_content("Mister Twister")

    end

    it 'i see a form to add a ride, when i do that ride is added to the list' do
      #happy path
      visit "mechanics/#{@chad.id}"

      expect(page).to have_content("Add Ride to Workload:")



      fill_in "Ride id number", with: "#{@cups.id}"
      click_on "Submit"

      expect(current_path).to eq("/mechanics/#{@chad.id}")

      within "#rides-#{@cups.id}" do
        expect(page).to_not have_content("#{@eraser.name}")
        expect(page).to have_content("Name: Tee Cups")
        expect(page).to have_content("Thrill Rating: 9")
      end
    end

    it 'i see an error message if i enter a non valid id' do
      #sad path
      visit "mechanics/#{@chad.id}"
      fill_in "Ride id number", with: "999"
      click_on "Submit"

      expect(current_path).to eq("/mechanics/#{@chad.id}")
      expect(page).to have_content("Error, no ride found")

      save_and_open_page
    end


  end






end
