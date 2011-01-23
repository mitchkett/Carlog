class Vehicle < ActiveRecord::Base
  has_many :service_visits
  belongs_to :make, :class_name => "VehicleMake"
  belongs_to :model, :class_name => "VehicleModel"
  belongs_to :user
  
  validates_presence_of :current_mileage, :message => "can't be blank"
  validates_presence_of :average_mileage, :message => "can't be blank"
  
  YEARS = (1989..Date.today.year + 1)
  
  def name
    [year,make.name, model.name].join(' ')
  end
  
  def estimated_mileage
    if mileage_last_changed_at.nil?
      current_mileage
    else
      time_diff = (DateTime.now - Date.parse(mileage_last_changed_at.to_s)).to_f
      if time_diff > 0
        time_diff = time_diff / 7
      end
      estimated = current_mileage + (average_mileage * time_diff)
      
      if estimated < current_mileage
        current_mileage
      else
        estimated
      end
    end
  end
end
