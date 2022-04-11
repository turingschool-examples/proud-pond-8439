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
end
