class VehicleMake < ActiveRecord::Base
  has_many :vehicles
  has_many :models, :class_name => "VehicleModel"
end
