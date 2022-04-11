class Mechanic < ApplicationRecord
  has_many :rides
  has_many :amusement_parks, through: :rides

  validates :name, presence: true
  validates :years_experience, presence: true, numericality: true

  # def self.avg_years_experience
  #   years_experience.average
  # end
end
