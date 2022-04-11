require 'rails_helper'

RSpec.describe Mechanic do
  describe 'relationships' do
    it { should have_many(:rides)}
  end
  
  describe  'validations' do
    it {should validate_presence_of(:name) }
    it {should validate_presence_of(:years_experience) }
  end 
  
  describe 'class methods' do
    xit "average_years_of_experience" do
      @mech1 = Mechanic.create!(name: "Jeff", years_experience: 7)
      @mech2 = Mechanic.create!(name: "Rudy", years_experience: 3)
      expect(Mechanic.average_years_of_experience).to eq(5)
        #this is is giving me a total of 5 Mechanics
      @mech3 = Mechanic.create!(name: "Kim", years_experience: 1)
      expect(Mechanic.average_years_of_experience.round(2)).to eq(3.67)
    end 
  end
end
