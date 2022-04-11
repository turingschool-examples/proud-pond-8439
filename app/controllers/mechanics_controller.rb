class MechanicsController < ApplicationController

  def index
    @mechanics = Mechanic.all
  end

  def show
    @mechanic = Mechanic.find(params[:id])
    # require "pry"; binding.pry
  end


end
