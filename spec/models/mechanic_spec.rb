require "rails_helper"

RSpec.describe Mechanic do
  let!(:jeff) { Mechanic.create!(name: "Jeff", years_experience: 2) }
  let!(:scruffy) { Mechanic.create!(name: "Scruffy", years_experience: 17) }
  let!(:don) { Mechanic.create!(name: "Don", years_experience: 5) }

  it "averages years of experience" do
    mechanics = Mechanic.all
    expect(mechanics.average_years_experience).to eq(8)
  end
end
