class ServiceVisit < ActiveRecord::Base
  REJECT_PROC = proc { |attrs| attrs.all? { |k, v| v.blank? } }

  belongs_to :vehicle
  has_many :service_jobs
  belongs_to :service_provider
  
  accepts_nested_attributes_for :service_jobs, :allow_destroy => true, :reject_if => REJECT_PROC
  
  def total_cost
    service_jobs.sum('cost_in_cents') / 100
  end
  
  def update_vehicle_mileage
    if vehicle.mileage_last_changed_at.nil? || visit_date > vehicle.mileage_last_changed_at.to_date
      vehicle.update_attributes(:current_mileage => mileage, :mileage_last_changed_at => visit_date)
    end
  end
  
end
