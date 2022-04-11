class MechanicsController < ApplicationController
  def index
    @mechanics = Mechanic.all
    @average_experience = Mechanic.average(:years_experience)
  end

  def show
    @mechanic = Mechanic.find(params[:id])
    @rides = @mechanic.rides.order(thrill_rating: :desc)
  end

end
