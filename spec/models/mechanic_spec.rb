require 'rails_helper'

RSpec.describe Mechanic do
  describe 'relationships' do
    it { should have_many :mechanic_rides}
    it { should have_many(:rides).through(:mechanic_rides) }
  end

  before :each do
    @mechanic_1 = Mechanic.create!(name:'Billy Johnson', years_experience: 26)
    @mechanic_2 = Mechanic.create!(name:'Sam Jones', years_experience: 25)
    @mechanic_3 = Mechanic.create!(name:'Francine Halls', years_experience: 15)
  end

  describe 'class methods' do
    it '#average_exp' do
      expect(Mechanic.average_exp).to eq(22)
    end
  end
end
