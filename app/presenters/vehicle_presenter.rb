class VehiclePresenter < CachingPresenter
  presents :vehicle
  
  def possible_makes
    VehicleMake.all
  end
  
  def possible_models
    VehicleModel.all
  end
  
  def possible_years
    Vehicle::YEARS.to_a.reverse
  end
end
