class MechanicsController < ApplicationController

  def index
    @mechanics = Mechanic.all
    @overall_average_exp = @mechanics.ave_years_experience
  end
