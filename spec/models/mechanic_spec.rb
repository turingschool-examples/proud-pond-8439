require 'rails_helper'

RSpec.describe Mechanic do
  describe 'relationships' do
    it {should belong_to(:ride)}
    it {should have_many(:rides)}
    # it {should have_many(:amusement_parks), through: :ride}

    it {should_validate_presence_of(:name)}
    it {should validate_presence_of(:years_experience)}
  end
end
