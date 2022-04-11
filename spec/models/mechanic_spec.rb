require 'rails_helper'

RSpec.describe Mechanic do
  describe 'relationships' do
    it { should have_many :mechanic_rides }
    it { should have_many(:rides).through(:mechanic_rides) }
  end

  describe 'class methods' do 
    before :each do 
      @josh = Mechanic.create!(name: 'Josh', years_experience: 2)
      @sal = Mechanic.create!(name: 'Sal', years_experience: 6)
      @kim = Mechanic.create!(name: 'Kim', years_experience: 10)
    end

    describe '#average_years_experience' do
      it 'returns the average years_experience of all mechanics' do 
        expect(Mechanic.average_years_experience).to eq(6)
      end
    end
  end
end
