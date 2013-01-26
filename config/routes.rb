Stor::Application.routes.draw do
  
  namespace :api do
    resources :lists do
      resources :items
      resources :fields
    end
  end

  match 'assets/*other' => "application#routing_error"
  match 'api/*other' => "application#routing_error"
  match '(*path)' => "home#index"
  
  #get "home/index"

  #explicit list matches
  #match 'lists/:id/edit' => 'lists#edit', :as => :edit_list, :via => :GET
  #match 'lists/new' => 'lists#new', :as => :new_list, :via => :GET

  # explicit list item matches
  #match 'lists/:list_id/new' => 'items#new', :as => :new_list_item, :via => :GET
  #match 'lists/:list_id/:id/edit' => 'items#edit', :as => :edit_list_item, :via => :GET

  #resources :lists do
  #  resources :fields
  #  resources :items, :path => ''
  #end

  #resources :field_attributes

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
