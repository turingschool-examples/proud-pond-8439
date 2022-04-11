class Mechanic < ApplicationRecord
has_many :mechanic_rides
has_many :rides, through: :mechanic_rides
validates_presence_of (:name)
validates_presence_of (:years_experience)

def ave_years_experience
  Self.average("years_experience")
  require "pry"; binding.pry
end
end
