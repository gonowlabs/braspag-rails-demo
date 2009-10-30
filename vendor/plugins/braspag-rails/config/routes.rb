ActionController::Routing::Routes.draw do |map|
  map.braspag 'braspag', :controller => :braspag, :action => :encrypt
end
