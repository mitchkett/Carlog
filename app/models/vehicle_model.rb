class VehicleModel < ActiveRecord::Base
  has_many :vehicles
  belongs_to :make, :class_name => "VehicleMake"

  named_scope :make, lambda { |make_id|
    { :conditions => { :vehicle_make_id => make_id }, :order => 'name asc' }
  }
end
