class Mechanic < ApplicationRecord
  has_many :mechanic_rides
  has_many :rides, through: :mechanic_rides

  def self.ave_years_exp
    average(:years_experience)
  end
end
