require 'rails_helper'

RSpec.describe Ride do
  describe 'relationships' do
    it { should belong_to(:amusement_park) }
    it { should have_many(:mechanics)}
  end
  
  describe  'validations'
    it {should validate_presence_of(:name) }
    it {should validate_presence_of(:thrill_rating) }
    it {should allow_value(true).for(:open) }
    it {should allow_value(false).for(:open) }
end
