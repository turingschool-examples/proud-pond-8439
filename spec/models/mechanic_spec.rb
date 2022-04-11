require 'rails_helper'

RSpec.describe Mechanic, type: :model do
  describe 'relationships' do
    it { should have_many :ride_mechanics}
    it { should have_many(:rides).through(:ride_mechanics)}
  end

  describe 'class methods' do
    it 'returns the average years of experience' do
      john = Mechanic.create!(name: 'John', years_experience: 5)
      amy = Mechanic.create!(name: 'Amy', years_experience: 3)
      sally = Mechanic.create!(name: 'Sally', years_experience: 2)
      sam = Mechanic.create!(name: 'Sam', years_experience: 10)
      expect(Mechanic.average_years_experience).to eq(5)
    end
  end

  describe 'instance methods' do
    it 'returns the open rides' do
      john = Mechanic.create!(name: 'John', years_experience: 5)
      six_flags = AmusementPark.create!(name: 'Six Flags', admission_cost: 75)
      coaster = john.rides.create!(name: 'Coaster', thrill_rating: 5, open: true, amusement_park_id: six_flags.id)
      water_slide = john.rides.create!(name: 'Water Slide', thrill_rating: 3, open: true, amusement_park_id: six_flags.id)
      tower = john.rides.create!(name: 'Tower', thrill_rating: 1, open: true, amusement_park_id: six_flags.id)
      bungee = john.rides.create!(name: 'Bungee', thrill_rating: 5, open: false, amusement_park_id: six_flags.id)
      twister = six_flags.rides.create!(name: 'Twister', thrill_rating: 2, open: true)
      expect(john.open_rides.count).to eq(3)
    end
  end
end
