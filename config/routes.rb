ActionController::Routing::Routes.draw do |map|
  
  map.login "login", :controller=>"user_sessions", :action=>"new"
  map.logout "logout", :controller=>"user_sessions", :action=>"destroy"
  
  map.connect "/attachments/updategrid", :controller => "attachments", :action => "updategrid"  
  map.resources :attachments
  map.resources :users
  map.resource :user_session
  
  map.root :controller => "attachments", :action => "index"
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

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing or commenting them out if you're using named routes and resources.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end


# 
# Bones::Application.routes.draw do |map|
#   # The priority is based upon order of creation:
#   # first created -> highest priority.
# 
#   # Sample of regular route:
#   #   match 'products/:id' => 'catalog#view'
#   # Keep in mind you can assign values other than :controller and :action
# 
#   # Sample of named route:
#   #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
#   # This route can be invoked with purchase_url(:id => product.id)
# 
#   # Sample resource route (maps HTTP verbs to controller actions automatically):
#   #   resources :products
# 
#   # Sample resource route with options:
#   #   resources :products do
#   #     member do
#   #       get :short
#   #       post :toggle
#   #     end
#   #
#   #     collection do
#   #       get :sold
#   #     end
#   #   end
# 
#   # Sample resource route with sub-resources:
#   #   resources :products do
#   #     resources :comments, :sales
#   #     resource :seller
#   #   end
# 
#   # Sample resource route with more complex sub-resources
#   #   resources :products do
#   #     resources :comments
#   #     resources :sales do
#   #       get :recent, :on => :collection
#   #     end
#   #   end
# 
#   # Sample resource route within a namespace:
#   #   namespace :admin do
#   #     # Directs /admin/products/* to Admin::ProductsController
#   #     # (app/controllers/admin/products_controller.rb)
#   #     resources :products
#   #   end
# 
#   # You can have the root of your site routed with "root"
#   # just remember to delete public/index.html.
#   # root :to => "welcome#index"
# 
#   # See how all your routes lay out with "rake routes"
# 
#   # This is a legacy wild controller route that's not recommended for RESTful applications.
#   # Note: This route will make all actions in every controller accessible via GET requests.
#   # match ':controller(/:action(/:id(.:format)))'
# end
