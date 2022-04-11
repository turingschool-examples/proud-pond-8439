require 'rails_helper'

RSpec.describe Mechanic do

  describe 'Relationships' do

    it {should have_many(:mechanics_rides)}
    it {should have_many(:rides).through (:mechanics_rides)}
  end
end
