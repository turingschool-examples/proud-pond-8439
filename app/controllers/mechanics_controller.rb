class MechanicsController < ApplicationController
  def index
    @mechanics = Mechanic.all
    @average_experience = Mechanic.average(:years_experience)
  end

end
