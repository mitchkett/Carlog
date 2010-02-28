class ModelsController < ApplicationController

  def index
    @models = VehicleModel.make(params[:make_id])
    render :layout => false
  end

end
