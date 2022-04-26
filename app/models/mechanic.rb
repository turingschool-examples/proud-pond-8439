class Mechanic < ApplicationRecord
  has_many :ride_mechanics
  has_many :rides, through: :ride_mechanics
  has_many :amusement_parks, through: :rides

  validates :name, presence: true
  validates :years_experience, presence: true, numericality: true

  def self.avg_years_exp
    average(:years_experience).round(2)
  end

  def work_on_rides
    rides.where(open: true).order(thrill_rating: :desc)
  end
end
