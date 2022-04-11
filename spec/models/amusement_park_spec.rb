require 'rails_helper'

RSpec.describe AmusementPark do
  describe 'relationships' do
    it { should have_many(:rides) }
  end

  describe 'instance methods' do
    describe '.admission_cost_to_currency' do
      it 'can format the admission cost to show two decimal places for dollars and cents' do
        amusement_park = AmusementPark.create!(name: 'Hershey Park', admission_cost: 50)

        expect(amusement_park.admission_cost_to_currency).to eq("50.00")
      end
    end
  end
end
