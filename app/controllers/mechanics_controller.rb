class MechanicsController < ApplicationController
  def index
    @mechanics = Mechanic.all
  end

  def show
    @mechanic = Mechanic.find(params[:id])
  end

  def new
  end

  def update
    binding.pry
    @mechanic = Mechanic.find(params[:id])
  end

end
