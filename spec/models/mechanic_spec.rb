require 'rails_helper'

RSpec.describe Mechanic do
  describe 'relationships' do
    it { should have_many(:rides) }
  end

  describe 'class methods' do
    before :each do
      @mechanic1 = Mechanic.create!(name: "Pabu", years_experience: 4)
      @mechanic2 = Mechanic.create!(name: "Thor", years_experience: 2)
      @mechanic2 = Mechanic.create!(name: "Loki", years_experience: 6)
    end
    it '#average_years_experience' do
      expect(Mechanic.average_years_experience).to eq(4)
    end
  end
end
