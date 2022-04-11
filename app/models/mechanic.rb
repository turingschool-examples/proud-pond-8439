class Mechanic < ApplicationRecord
  has_many :mechanic_rides
  has_many :rides, through: :mechanic_rides

  def self.average_exp
    average(:years_experience)
  end

  def open_rides
    rides.where(open: true)
  end
end
