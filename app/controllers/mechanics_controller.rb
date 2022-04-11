class MechanicsController < ApplicationController
  def index
    @mechanics = Mechanic.all
    @average_exp = Mechanic.average(:experience)
  end

  def show
    @mechanic = Mechanic.find(params[:id])
    @open_rides = @mechanic.open_rides
  end

end
