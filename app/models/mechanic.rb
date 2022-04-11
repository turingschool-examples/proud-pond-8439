class Mechanic < ApplicationRecord

  has_many :mechanic_rides
  has_many :rides, through: :mechanic_rides

  def self.all_average_exp
    average(:years_experience).to_f
  end

  def open_rides_desc
    rides.where(open: true).order("thrill_rating DESC")
  end

end
