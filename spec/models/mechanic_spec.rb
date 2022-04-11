require 'rails_helper'

describe Mechanic do
  describe 'relationships' do
    it {should have_many(:ride_mechanic)}
    it {should have_many(:ride)}
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_numericality_of(:years_experience) }
  end

  before do
    @mech_1 = Mechanic.create!(
      name: 'John Mulany',
      years_experience: 25
    )
    @mech_2 = Mechanic.create!(
      name: 'Jane Bologni',
      years_experience: 45
    )
  end

  describe 'class methods' do
    it 'calculates the average age of all mechanics' do
      expect(Mechanic.average_yoe).to eq(35)
    end
  end
end
