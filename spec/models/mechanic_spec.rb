require 'rails_helper'

RSpec.describe 'Class methods' do
  it 'can return the avg years experience' do
    mech_1 = Mechanic.create!(name: 'John', years_of_experience: 8)
    mech_2 = Mechanic.create!(name: 'Michelle', years_of_experience: 14)
    mech_4 = Mechanic.create!(name: 'Mike', years_of_experience: 6)
    mech_3 = Mechanic.create!(name: 'Sarah', years_of_experience: 12)
    expect(Mechanic.avg_years_experience.round).to eq(10)
  end
end