require 'rails_helper'

RSpec.describe 'Mechanic' do
  describe 'class methods' do
    it '#avg_experience' do
      mechanic_1 = Mechanic.create!(name: "Joey Simpson", years_experience: 5)
      mechanic_2 = Mechanic.create!(name: "Dolly Jackson", years_experience: 16)
      mechanic_3 = Mechanic.create!(name: "Mac Berger", years_experience: 12)
      mechanic_4 = Mechanic.create!(name: "Red Valance", years_experience: 24)
      expect(Mechanic.avg_experience).to eq(14.25)
    end
  end
end
