class MechanicsController < ApplicationController
  def index
    @mechanics = Mechanic.all
    @avg_years_exp = Mechanic.all.average(:years_experience).round(2)
  end
end
