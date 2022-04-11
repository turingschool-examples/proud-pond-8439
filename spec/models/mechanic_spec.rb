require 'rails_helper'

RSpec.describe Ride do
  describe 'relationships' do
    it { should have_many :rides}
    it { should have_many(:rides).through(:ride_mechanics)}
  end
end
