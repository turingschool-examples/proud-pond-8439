require 'rails_helper'

RSpec.describe "Mechanics Index page", type: :feature do
  before (:each) do
    @kara = Mechanic.create!(name: "Kara Smith", years_experience: 11)
    @dixie = Mechanic.create!(name: "Dixie Kong", years_experience: 3)
  end

  describe "when I visit the mechanics index page" do
    it "lists all mechanics and their attributes" do
      visit "/mechanics"

      expect(page).to have_content("Kara Smith")
      expect(page).to have_content("Dixie Kong")
      expect(page).to have_content("11")
      expect(page).to have_content("3")
      expect(page).to have_content("All Mechanics")
    end
  end
end
