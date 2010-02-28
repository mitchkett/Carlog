class ServiceJob < ActiveRecord::Base
  belongs_to :service_visit
  belongs_to :maintenance_category
  
  money :cost
end
