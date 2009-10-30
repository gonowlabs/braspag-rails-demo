ActionController::Routing::Routes.draw do |map|
  map.confirmation '/confirmation', :controller => 'application', :action => 'confirmation'
  map.products '/products', :controller => 'application', :action => 'products'
  map.all '/all', :controller => :application, :action => "all"
  map.root :controller => :application, :action => "show"
end
