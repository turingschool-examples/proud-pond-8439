require 'rails_helper'

RSpec.describe "Mechanics show page" do
  before (:each) do
    @kara = Mechanic.create!(name: "Kara Smith", years_experience: 11)
    @dixie = Mechanic.create!(name: "Dixie Kong", years_experience: 3)
  end

  describe "when I visit a mechanic show page" do
    it "displays their attributes" do
      visit "/mechanics/#{@kara.id}"

      expect(page).to have_content("Kara Smith")
      expect(page).to have_content("11")
      expect(page).to_not have_content("Dixie Kong")
    end
  end
end
