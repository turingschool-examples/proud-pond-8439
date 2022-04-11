class Mechanic < ApplicationRecord
  validates :name, presence: true
  validates :years_of_experience, presence: true, numericality: true
end
