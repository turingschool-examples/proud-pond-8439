require 'rails_helper'

RSpec.describe Ride, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name)}
    it { should validate_numericality_of(:thrill_rating)}
    it { should allow_value([true, false]).for(:open) }
    it { should_not allow_value(nil).for(:open) }
  end

  describe 'relationships' do
    it { should belong_to(:amusement_park) }
  end


end
