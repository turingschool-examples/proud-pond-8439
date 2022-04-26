require "rails_helper"

RSpec.describe Mechanic do
  describe "relationships" do
    it { should have_many(:rides) }
    it { should have_many(:amusement_parks).through(:rides) }
  end

  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:years_experience) }
    it { should validate_numericality_of(:years_experience) }
  end

  describe "average years of experience" do
    it "shows average years of experience for all mechanics listed" do
      mechanic1 = Mechanic.create!(name: "Kara Smith", years_experience: 11)
      mechanic2 = Mechanic.create!(name: "Mike Dao", years_experience: 2)
      mechanic3 = Mechanic.create!(name: "Dani Coleman", years_experience: 3)
      mechanics = Mechanic.all

      expect(mechanics.avg_years_exp).to eq(5.33)
    end
  end
end
