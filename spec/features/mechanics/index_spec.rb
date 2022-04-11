require 'rails_helper'

RSpec.describe "mechanics index page" do
  before :each do
    @mechanic1 = Mechanic.create!(name: "Pabu", years_experience: 4)
    @mechanic2 = Mechanic.create!(name: "Thor", years_experience: 2)
    @mechanic2 = Mechanic.create!(name: "Loki", years_experience: 6)
  end
  describe "User story 1" do
    it "has header" do
      expect(page).to have_content("All Mechanics")
    end
    it "shows mechanic attributes" do
      within("#mechanic-#{@mechanic1.id}") do
        expect(page).to have_content("#{@mechanic1.name}")
        expect(page).to have_content("#{@mechanic1.years_experience}")
        expect(page).to_not have_content("#{@mechanic2.name}")
        expect(page).to_not have_content("#{@mechanic2.years_experience}")
      end
      within("#mechanic-#{@mechanic2.id}") do
        expect(page).to have_content("#{@mechanic2.name}")
        expect(page).to have_content("#{@mechanic2.years_experience}")
        expect(page).to_not have_content("#{@mechanic1.name}")
        expect(page).to_not have_content("#{@mechanic1.years_experience}")
      end
    end
    it "shows average years of experience" do
      within("#mechanic-experience") do
        expect(page).to have_content("Average years of experience: 4")
      end
    end
  end
end
