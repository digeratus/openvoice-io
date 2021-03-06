ActionController::Routing::Routes.draw do |map|
  map.resources :sys_configs

  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller
  
  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  # map.root :controller => "welcome"
  map.connect 'phone_numbers/get_user', :controller => 'phone_numbers', :action => 'locate_user'
  # map.logout '/logout', :controller => 'user_sessions', :action => 'destroy'

  map.connect '/genapikey', :controller => 'profiles', :action => 'genapikey'
  map.connect '/call.:format', :controller => 'voice_calls', :action => 'create'
  map.connect '/sms.:format', :controller => 'messagings', :action => 'create'
  map.connect '/api', :controller => 'profiles', :action => 'api'
  map.connect '/logout', :controller => 'profiles', :action => 'logout'

  map.connect '/play/:id.:format', :controller => 'voicemails', :action => 'play'


  # map.resource :sessions
  # map.login '/login', :controller => 'sessions', :action => 'new'
  # map.logout '/logout', :controller => 'sessions', :action => 'destroy'
  
  # See how all your routes lay out with "rake routes"
  # map.resource :user_session
  # map.root :controller => "user_sessions", :action => "new"
  # map.root :controller => "contacts", :action => "index"
  # map.root :controller => "profiles", :action => "index"
  map.root :controller => "profiles", :action => "home"
  map.connect '/home', :controller => "profiles", :action => "home"
  map.connect '/widget', :controller => "profiles", :action => "widget"
  map.connect '/profiles/map', :controller => "profiles", :action => "map"
  map.connect '/gmailcontacts', :controller => "contacts", :action => "gmailcontacts"
  # map.connect '/gmailcontacts2', :controller => "contacts", :action => "gmailcontacts2"
  

  map.resource :account, :controller => "users"
  # map.resources :users do |user|
  #   user.resources :phone_numbers
  #   user.resources :voicemails
  #   user.resources :messagings
  #   user.resources :call_logs
  #   user.resources :voice_calls
  #   user.resources :contacts
  #   user.resources :profiles
  # end

  map.resources :phone_numbers
  map.resources :voicemails
  map.resources :messagings
  map.resources :call_logs
  map.resources :voice_calls
  map.resources :contacts
  map.resources :profiles

  
  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing or commenting them out if you're using named routes and resources.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
