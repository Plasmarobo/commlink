Commlink::Application.routes.draw do
  get "rules/new"

  get "rules/upload"

  get "rules/download"

  get "rules/move"

  get "chummer/new"

  get "chummer/edit"

  get "chummer/finish"

  get "chummer/update"

  get "chummer/view"

  resources :node_templates

  get "skillset/new"

  get "skillset/edit"

  get "skillset/delete"

  get "programset/new"

  get "programset/edit"

  get "programset/delete"

  get "node/new"

  get "node/list"

  get "node/edit"

  get "node/delete"

  get "groups/new"

  get "groups/list"


  get "gamesession/new"

  get "gamesession/list"

  get "gamesession/gm"

  get "gamesession/player"

  get "actions/hack_otf"

  get "actions/hack_tyt"

  get "actions/reveal"

  get "actions/observe"

  get "actions/encrypt"

  get "actions/crash_node"

  get "actions/spoof_cmd"

  get "actions/spoof_track"

  get "actions/repair_icon"

  get "actions/crash_prog"

  get "actions/disarm_db"

  get "actions/decrypt"

  get "actions/scan"

  get "actions/hide"

  get "groups/create"

  get "groups/edit"

  get "groups/delete"

  get "gamesession/create"

  get "gamesession/edit"

  get "gamesession/delete"

  get "gamesession/manage"

  get "gamesession/advance"

  get "player/new"

  post "player/new"

  post "player/parsexml"

  get "player/edit"

  post "player/select"

  get "player/list"

  get "player/delete"

  get "sessions/login"

  post "session/login_attempt"

  get "sessions/home"

  get "sessions/profile"

  get "sessions/setting"

  get "login/home"

  get "login/profile"

  get "users/new"

  get "users/create"

  post "users/new"

  post "users/create"

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
  #  root :to => 'user#index'
  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'

  root :to => "sessions#home"
  match "signup", :to => "users#new"
  match "login", :to => "sessions#login"
  match "logout", :to => "sessions#logout"
  match "home", :to => "sessions#home"
  match "profile", :to => "sessions#profile"
  match "setting", :to => "sessions#setting"
  match "login_attempt", :to => "sessions#login_attempt"
  match "register", :to => "users#new"
  match "player", :to => "player#list"
  match "upload", :to => "player#new"
end
