PlewDev1::Application.routes.draw do


  resources :vids

  # chwilowa akcja
  get "portfolio" => "home#portfolio", :as => :portfolio
  

  match "/:section/fotografia-autorska" => "front_section#auth_gallery", :as => :auth_gallery
  match "/:section/fotografia-autorska/:id" => "front_section#auth_gallery", :as => :auth_gallery_specific
  match "/:section/fotografia-komercyjna" => "front_section#com_gallery", :as => :com_gallery
  match "/:section/fotografia-komercyjna/:id" => "front_section#com_gallery", :as => :com_gallery_specific
  match "/:section/video" => "front_section#vid", :as => :front_vid
  match "/:section/video/:id" => "front_section#single_vid", :as => :front_vid_single
  match "/:section/info" => "front_section#info", :as => :info



  match 'zmien-jezyk/:locale' => 'application#set_locale', :as => :set_language
  match 'zmien-uzytkownika/:section' => 'admin#set_section', :as => :set_section
  
  get "home/index"

  match "admin" => "admin#index", :as => :admin
  match "admin/login" => "admin#login", :as => :admin_login
  match "admin/enter" => "admin#enter", :as => :admin_enter
  match "admin/logout" => "admin#logout", :as => :admin_logout

  match "galeria/:type" => "galleries#set_gallery_type", :as => :set_gallery_type
  resources :galleries
  
  resources :pages


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
  root :to => 'home#index'
  
  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
