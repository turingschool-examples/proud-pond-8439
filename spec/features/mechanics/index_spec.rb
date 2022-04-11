require 'rails_helper'


RSpec.describe "Mechanics Index Page" do

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

    it 'has a list of all mechanic names and their experience and avg of all mechanics experience' do
      visit "/mechanics"

      expect(page).to have_content("All Mechanics")
      # save_and_open_page
      within "#mechanic-#{@bob.id}" do
        expect(page).to have_content("Name: bob")
        expect(page).to have_content("Experience: 15")
        expect(page).to_not have_content("Name: joe")
      end

      within "#mechanic-#{@joe.id}" do
        expect(page).to have_content("Name: joe")
        expect(page).to have_content("Experience: 8")
        expect(page).to_not have_content("Name: chad")
      end

      within "#mechanic-#{@skeeter.id}" do
        expect(page).to have_content("Name: skeeter")
        expect(page).to have_content("Experience: 4")
        expect(page).to_not have_content("Name: joe")
      end

      within "#mechanic-#{@chad.id}" do
        expect(page).to have_content("Name: chad")
        expect(page).to have_content("Experience: 26")
        expect(page).to_not have_content("Experience: 8")
      end

      expect(page).to have_content("All Mechanics AVG Experience: 13.25")
    end

  end






end
