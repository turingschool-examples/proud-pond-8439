require 'rails_helper'

RSpec.describe Ride, type: :model do

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:thrill_rating) }
    # Testing boolean values isn't recommended as they convert non-boolean values to boolean.
  end

  describe 'relationships' do
    it { should belong_to(:amusement_park) }
  end
end
