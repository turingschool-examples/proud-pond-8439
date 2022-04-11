require 'rails_helper'

describe Mechanic, type: :model  do
  describe 'validations' do
    it { should validate_presence_of(:name)}
    it { should validate_numericality_of(:years_of_experience)}
  end

  describe 'relationships' do
    it { should have_many(:rides) }
  end

  describe '::average_experience' do
    it 'finds average of all mechanics' do
      @mechanic1 = Mechanic.create!(name: 'Sherman', years_of_experience: 3)
      @mechanic3 = Mechanic.create!(name: 'Scott', years_of_experience: 16)
      @mechanic2 = Mechanic.create!(name: 'Susan', years_of_experience: 6)

      expect(Mechanic.average_experience).to eq(8.33)
    end
  end
end