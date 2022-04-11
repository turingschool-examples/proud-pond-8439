class Mechanic < ApplicationRecord
  has_many :ride_mechanics

  validates_presence_of :name
  validates_presence_of :years_experience

  def self.avg_yrs_experience
    average(:years_experience)
  end
end
