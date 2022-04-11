require 'rails_helper'

RSpec.describe index, type: :feature do

  before :each do
    @adam = Mechanic.create(name: "Adam", years_experience: 9)
    @brenda = Mechanic.create(name: "Brenda", years_experience: 17)
    @carl = Mechanic.create(name: "Carl", years_experience: 5)
  end

  it 'possesses attributes for all mechanics' do
    visit '/mechanics/'

    within('#mechanics') do
      expect(page).to have_content(@adam.name)
      expect(page).to have_content(@brenda.name)
      expect(page).to have_content(@carl.name)
      expect(page).to have_content(@adam.years_experience)
      expect(page).to have_content(@brenda.years_experience)
      expect(page).to have_content(@carl.years_experience)
    end
  end

end