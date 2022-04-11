require 'rails_helper'

describe Mechanic do
  describe 'relationships' do
    it {should have_many(:ride_mechanic)}
    it {should have_many(:ride)}
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_numericality_of(:years_experience) }
  end
end
