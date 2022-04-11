require 'rails_helper'

describe AmusementPark, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name)}
    it { should validate_numericality_of(:admission_cost)}
  end

  describe 'relationships' do
    it { should have_many(:rides) }
  end
end
