class MakesController < ApplicationController

  def index
    @makes = VehicleMake.all()
    render :layout => false
  end

end
