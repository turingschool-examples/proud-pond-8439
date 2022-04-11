class AmusementParksController < ApplicationController
  def show
    @park = AmusementPark.find(params[:id])
    @rides = @park.all_park_rides
  end
end
