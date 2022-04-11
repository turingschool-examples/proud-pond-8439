class Ride < ApplicationRecord
  belongs_to :amusement_park
  has_many :ride_mechanics
  has_many :mechanics, through: :ride_mechanics

  def self.average_thrill_rating
    average(:thrill_rating).to_f
  end
end
