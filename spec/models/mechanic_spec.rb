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
end
