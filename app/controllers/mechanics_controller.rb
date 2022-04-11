class MechanicsController < ApplicationController

  def index
    @mechanics = Mechanic.all
  end

  def create
    ride_id = params[:ride_id].to_i
    mech_id = params[:id].to_i
    ride = Ride.find(ride_id)
    @mechanic = Mechanic.find(mech_id)
    new_ride_mech = RideMechanic.create!(ride_id: ride_id, mechanic_id: mech_id)
    new_ride_mech.save
    redirect_to "/mechanics/#{@mechanic.id}"
  end

  def show
    if params[:ride_id].present?
      @mechanic = Mechanic.find(params[:id])
      @ride = Ride.search(params[:id])
      # @ride_mechanic = @mechanic.ridemechanics.create!(ride_id: ride.id, mechanic_id: @mechanic.id)
      # @ride_mechanic.save
      # redirect_to "/mechanics#{@mechanic.id}"
    else
      @mechanic = Mechanic.find(params[:id])
    end
  end
end
