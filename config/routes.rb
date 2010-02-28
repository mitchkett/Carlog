ActionController::Routing::Routes.draw do |map|
  map.resources :users

  map.resource :session

  map.resources :service_providers

  map.resources :vehicles do |vehicles_map|
    vehicles_map.resources :service_visits
  end

  map.resources :makes,  :only => :index
  map.resources :models, :only => :index

  map.root :vehicles
end
