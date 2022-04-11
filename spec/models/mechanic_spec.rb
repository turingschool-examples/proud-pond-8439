require 'rails_helper'

RSpec.describe Mechanic do
  describe 'relationships' do
    it { should have_many(:ride_mechanics) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:years_experience) }
  end

  describe 'class methods' do
    it '#avg_yrs_experience' do
      mechanic2 = Mechanic.create!(name: "Legolas Smith", years_experience: 8)
      mechanic3 = Mechanic.create!(name: "Hermione Baggins", years_experience: 7)
      mechanic4 = Mechanic.create!(name: "Katniss Skywalker", years_experience: 12)
      mechanic5 = Mechanic.create!(name: "Cersei Malfoy", years_experience: 8)

      expect(Mechanic.avg_yrs_experience).to eq(8.75)
      expect(Mechanic.avg_yrs_experience).not_to eq(8.7)
    end
  end

end
