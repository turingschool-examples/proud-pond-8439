class MechanicsController < ApplicationController

  def index
    @mechanics = Mechanic.all
  end

  def show
    if params[:ride_id].present?
      @mechanic = Mechanic.find(params[:id])
      @ride = Ride.search(params[:id])
      @ride.save 
    else
      @mechanic = Mechanic.find(params[:id])
    end
  end
end
