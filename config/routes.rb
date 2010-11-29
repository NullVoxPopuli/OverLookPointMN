ActionController::Routing::Routes.draw do |map|
  map.resources :link_pages

  map.resources :link_pages

  map.resources :services

  # The priority is based upon order of creation: first created -> highest priority.
  
  map.resource :user_session
  map.resource :account, :controller => "users"
  map.resources :password_resets
  map.resources :users
  map.resources :addresses
  
  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end
  map.with_options(:conditions => {:subdomain => "admin"}) do |subdom|
    subdom.root :controller => 'site_admin/admin', :action => 'index'
    subdom.with_options(:namespace => 'site_admin/', :name_prefix => 'admin_', :path_prefix => nil) do |admin|
      #admin.resources :admin, :member => { :charge => :post }
    end
  end
  
  map.root :controller => "info", :action => "home"
  map.connect "/home", :controller => "info", :action => "home"
  map.connect "/register", :controller => :users, :action => :new
  #map.connect "/admin", :controller => admin, :action => :show
  
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

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  # map.root :controller => "welcome"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing or commenting them out if you're using named routes and resources.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
