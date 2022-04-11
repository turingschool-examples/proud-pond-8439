class RideMechanicsController < ApplicationController
  def create
    ride_mech = RideMechanic.create!(
      mechanic_id: params[:mechanic_id],
      ride_id: params[:ride_id]
    )

    ride_mech.save

    redirect_to "/mechanics/#{params[:mechanic_id]}"
  end
end
