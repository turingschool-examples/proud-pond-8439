require 'rails_helper'

RSpec.describe Mechanic, type: :model do

  describe 'relationships' do

    it { should have_many :mechanic_rides }
    it { should have_many(:rides).through(:mechanic_rides)}

  end

  describe 'methods' do
    before do
      @bob = Mechanic.create!(name: 'bob', years_experience: 15)
      @joe = Mechanic.create!(name: 'joe', years_experience: 8)
      @skeeter = Mechanic.create!(name: 'skeeter', years_experience: 4)
      @chad = Mechanic.create!(name: 'chad', years_experience: 26)
    end

    it 'retruns the average experience of all mechanics' do

      expect(Mechanic.all_average_exp).to eq(13.25)
    end




  end




end
