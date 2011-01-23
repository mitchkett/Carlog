# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  def section(section)
    content_for :section, section
  end
  
  def header(&block)
    content_for :header, &block
  end
  
  def current_user_vehicles
    Vehicle.all(:order => 'year desc, make_id, model_id')
  end

end
