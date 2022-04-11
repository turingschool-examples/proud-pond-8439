class Ride < ApplicationRecord
  belongs_to :amusement_park
  has_and_belongs_to_many :mechanics
  has_many :mechanics, through: :mechanic_rides
end
