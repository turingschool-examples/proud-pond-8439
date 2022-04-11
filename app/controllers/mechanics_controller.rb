class MechanicsController < ApplicationController
  def index
    @mechs = Mechanic.all 
  end
  
  def show 
    @mech = Mechanic.find(params[:id])
    @rides = @mech.rides.order(thrill_rating: :desc)
  end
end 
