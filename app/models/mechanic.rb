class Mechanic < ApplicationRecord
  has_many :rides, through: :ride_mechanics

  def self.average_years
    @mechanics = Mechanic.all
    years_array = []
    @mechanics.each {|mechanic| years_array << mechanic.years_experience}
    years_array.sum.to_f / years_array.size.to_f
  end
end
