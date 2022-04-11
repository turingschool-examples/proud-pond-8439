class Mechanic < ApplicationRecord
  has_and_belongs_to_many :rides
  has_many :rides, through: :mechanic_rides


  def self.average_years_experience
    Mechanic.average(:years_experience)
  end
end
