require 'rails_helper'

RSpec.describe Mechanic do
  describe 'relationships' do
    it { should have_many :ride_mechanics }
    it { should have_many(:rides).through(:ride_mechanics) }
  end

  describe 'class methods' do
    describe '#average_years_experience' do
      it 'can determine the average years of experience for all mechanics' do
        mechanic_1 = Mechanic.create!(name: "James", years_experience: 20)
        mechanic_2 = Mechanic.create!(name: "Ian", years_experience: 19)
        mechanic_3 = Mechanic.create!(name: "Tom", years_experience: 22)

        expect(Mechanic.average_years_experience).to eq(20.33)
      end
    end
  end

  describe 'instance methods' do
    describe '.open_rides_by_thrill_rating' do
      it 'can return a given mechanics open rides sorted by thrill rating' do
        amusement_park = AmusementPark.create!(name: 'Hershey Park', admission_cost: 50)
        mechanic_1 = Mechanic.create!(name: "James", years_experience: 20)
        ride_1 = mechanic_1.rides.create!(name: "The Great Bear", thrill_rating: 8, open: true, amusement_park_id: amusement_park.id)
        ride_2 = mechanic_1.rides.create!(name: "Farenheit", thrill_rating: 9, open: false, amusement_park_id: amusement_park.id)
        ride_3 = mechanic_1.rides.create!(name: "Storm Runner", thrill_rating: 10, open: true, amusement_park_id: amusement_park.id)
        ride_4 = mechanic_1.rides.create!(name: "Skyrunner", thrill_rating: 9, open: true, amusement_park_id: amusement_park.id)

        expect(mechanic_1.open_rides_by_thrill_rating).to eq([ride_3, ride_4, ride_1])
      end
    end
  end
end
