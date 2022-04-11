require 'rails_helper'

RSpec.describe Mechanic do
  before do
    @john = Mechanic.create!(name: "John", years_experience:1)
    @paul = Mechanic.create!(name: "Paul", years_experience:2)
    @george = Mechanic.create!(name: "George", years_experience:3)
    @ringo = Mechanic.create!(name: "Ringo", years_experience:4)
  end
  describe 'relationships' do
    it { should have_many :mechanic_rides }
    it { should have_many(:rides).through(:mechanic_rides) }
  end
  describe 'class methods' do
    it '#ave_years_exp returns ave years exp across all mechanics' do
      expect(Mechanic.ave_years_exp).to eq(2.5)
    end
  end
end
