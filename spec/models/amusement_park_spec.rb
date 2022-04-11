require 'rails_helper'

RSpec.describe AmusementPark do
  describe 'relationships' do
    it { should have_many(:rides) }
    it { should validate_presence_of(:name)}
    it { should validate_presence_of(:admission_cost)}
  end
end
