class RidesController < ApplicationController

  def index
    @rides = Rides.all
  end
