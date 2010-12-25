ActionController::Routing::Routes.draw do |map|

  map.resources :services

  map.namespace "admin" do |admin|
    admin.root :controller => :site_prefs, :action => :index
    admin.resources :site_prefs
    admin.resources :link_pages
    admin.resources :menu_bars
    admin.resources :services
  end
 
  # map.with_options(:conditions => {:subdomain => 'admin'}) do |subdom|
  #   subdom.root :controller => 'site_admin/admin', :action => 'index'
  #   subdom.with_options(:namespace => 'site_admin/', :name_prefix => 'admin_', :path_prefix => nil) do |admin|
  #     admin.resources :admin
  #     admin.resources :link_pages
  #   end
  # end
  
  # match '/' => 'site_admin/admin#index', :constraints => {:subdomain => "admin"}

  map.root :controller => "info", :action => "home"
  
  map.connect "/home", :controller => "info", :action => "home"
  map.connect "/register", :controller => :users, :action => :new
  
  
  map.resource :user_session
  map.resource :account, :controller => "users"
  map.resources :password_resets
  map.resources :users
  map.resources :addresses


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
