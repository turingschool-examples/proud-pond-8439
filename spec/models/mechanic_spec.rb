require 'rails_helper'

RSpec.describe Mechanic do

  describe 'Relationships' do

    it {should have_many :mechanics_ride}
    it {should have_many(:rides).through (:mechanics_ride)}
  end
end
