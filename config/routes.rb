Rails.application.routes.draw do
  root 'messages#index'
  resources :users, :only => [:create, :show]
  resources :comments, only: [:new, :create]
  resources :messages
#users controller
  get '/signup', to: 'users#new'

#players controller
  get '/rpg/players/:id' => 'players#show'
#display controller
  get '/help', to: 'display#help'
  get '/about', to: 'display#about'
  get '/index', to: 'display#index'

  #sessions controller
  get    '/signin'   => 'sessions#new'
  post   '/signin'   => 'sessions#create'
  delete '/signout'  => 'sessions#destroy'

  # rpg controller
  get '/rpg' => 'rpg#index'

  get '/rpg/class_picker/:class_picked' => 'rpg#class_picker'
  get '/rpg/store' => 'rpg#store'
  get '/rpg/purchase_item/:item_id' => 'rpg#purchase_item'
  get '/rpg/go_city' => 'rpg#go_city'
  get '/rpg/go_jungle' => 'rpg#go_jungle'
  get '/rpg/targets' => 'rpg#targets'
  get '/rpg/attack_target/:target_id' => 'rpg#attack_target'
  get '/rpg/battles/:id' => 'battle#show'
  get '/rpg/find_battles/:id' => 'battle#find_battles'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
