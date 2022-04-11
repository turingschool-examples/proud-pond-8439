class Mechanic < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :years_experience
  has_many :ride_mechanics
  has_many :rides, through: :ride_mechanics
  
  def self.average_years_of_experience
    require "pry"; binding.pry
    average(:years_experience)

  end
end 
