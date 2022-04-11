require "rails_helper"
RSpec.describe 'Mechanic Index' do
  before:each do
    @mech1 = Mechanic.create!(name: "Jeff", years_experience: 7)
    @mech2 = Mechanic.create!(name: "Rudy", years_experience: 2)
    @mech3 = Mechanic.create!(name: "Kim", years_experience: 12)
  end
  it "has header" do
    visit '/mechanics'
    save_and_open_page
    expect(page).to have_content("All Mechanics")
    # expect(page).to have_content("Average Years of Experience: 7.66")
    within("#mech-#{@mech3.id}") do
      expect(page).to have_content("Kim")
      expect(page).to have_content("Years of Experience: 12")
    end 
  end
end
