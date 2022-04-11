class MechanicsController < ApplicationController
  def index
    @mechanics = Mechanic.all
    @average_years_experience = Mechanic.average_years_experience
  end

  def show
    @mechanic = Mechanic.find(params[:id])
    # require 'pry'; binding.pry
    @open_rides = @mechanic.rides.where(open: true)
    # require 'pry'; binding.pry
  end
end
