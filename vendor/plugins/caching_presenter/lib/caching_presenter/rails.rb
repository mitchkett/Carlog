ActionController::Base.instance_eval do
  include CachingPresenter::InstantiationMethods
end