class Mechanic < ApplicationRecord

  def self.avg_experience
    average(:years_experience)
  end
end
