class MechanicsController < ApplicationController

  def index
    @mechanics = Mechanic.all
  end

  def show
    @mechanic = Mechanic.find(params[:id])
    @rides = @mechanic.rides.descending_thrill_and_open
  end

  def update
    target_mechanic = Mechanic.find(params[:id])
    target_ride = Ride.find(params[:ride_id])
    target_mechanic.rides << target_ride
    redirect_to "/mechanics/#{params[:id]}"
  end

end
