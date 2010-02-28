class ServiceProvider < ActiveRecord::Base
  has_many :service_visits
end
