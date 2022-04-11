class MechanicsRidesController < ApplicationController

  def create
    mechride = MechanicsRide.new(mechride_params)
    if mechride.save
      redirect_to "/mechanics/#{mechride.mechanic_id}"
    else
      redirect_to "/mechanics/#{mechride.mechanic_id}"
    end
  end

  private

  def mechride_params
    params.permit(:mechanic_id, :ride_id)
  end

end