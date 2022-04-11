class MechanicRidesController < ApplicationController
  def create
    MechanicRide.create!(ride_id: Ride.find(params[:ride_id]), mechanic_id: params[:id])
    redirect_to "/mechanics/#{@mechanic1.id}"
  end
end
