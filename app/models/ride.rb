class Ride < ApplicationRecord
  belongs_to :amusement_park

  has_many :ride_mechanic
  has_many :mechanics, through: :ride_mechanic
end
