class Mechanic < ApplicationRecord

  #belongs_to :
  has_many :ride_mechanics
  has_many :rides, through: :ride_mechanics


end
