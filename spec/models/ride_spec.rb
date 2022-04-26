require "rails_helper"

RSpec.describe Ride do
  describe "relationships" do
    it { should belong_to(:amusement_park) }
    it { should have_many(:mechanics) }
  end

  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:thrill_rating) }
    it { should validate_numericality_of(:thrill_rating) }
    it { should validate_inclusion_of(:open).in_array([true, false]) }
  end
end
