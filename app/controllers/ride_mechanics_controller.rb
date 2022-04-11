class RideMechanicsController < ApplicationController

  def create
    mechanic = Mechanic.find(params[:id])
    RideMechanic.create(ride_id: Ride.find(params[:ride_id]).id, mechanic_id: mechanic.id)
    redirect_to "/mechanics/#{mechanic.id}"
  end
end
