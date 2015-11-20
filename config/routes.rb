Rails.application.routes.draw do

  get 'home/index'
  root 'home#index'

  get 'auth/:provider/callback', to: 'sessions#fb_create'
  get 'auth/failure', to: redirect('/')

  get 'signup', to: 'users#new', as: 'signup'
  post 'signup', to: 'users#create'

  get 'login', to: 'sessions#new', as: 'login'
  post 'login', to: 'sessions#create'

  get 'sessions/create'

  delete 'logout', to: 'sessions#destroy', as: 'logout'

  get '/listings/new', to: 'listings#new', as: 'listings_new'
  post '/listings/new', to: 'listings#create'


  get '/listings/index', to: 'listings#index'
  get '/listings/:id', to: 'listings#show', as: 'listing'

  get '/users/:id/edit', to: 'users#edit', as: 'edit_user'
  put '/users/:id/edit', to: 'users#update'

  get '/reservations/new', to: 'reservations#new'
  post '/reservations/create', to: 'reservations#create'
  get '/reservations/:id', to: 'reservations#show'

  resources :users, only: :show

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
