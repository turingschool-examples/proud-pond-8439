class RideMechanicsController < ApplicationController
  def create
    ride_mechanic = RideMechanic.new({
      mechanic_id: params[:id],
      ride_id: params[:add_a_ride_to_workload],
      })
    ride_mechanic.save
    redirect_to "/mechanics/#{params[:id]}"
  end
end
