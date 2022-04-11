class Mechanic < ApplicationRecord

  has_many :mechanics_ride
  has_many :rides, through: :mechanics_ride

end
