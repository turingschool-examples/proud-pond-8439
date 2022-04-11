class AmusementParksController < ApplicationController
  def show
    @park = AmusementPark.find(params[:id])
    @rides = @park.rides.order_by_name
  end
end
