class MechanicsController < ApplicationController
  def index
    @mechanics = Mechanic.all
    @avg_experience = Mechanic.avg_years_experience.round(1).to_f
  end

  def show
    @mechanic = Mechanic.find(params[:id])
  end
end
