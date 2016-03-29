
Rails.application.routes.draw do
  get 'photos/index'

  get 'photos/new'

  post 'photos/create'

  get 'photos/destroy'

  resources :tasks do
    member do
      get 'show_reservations'
    end
  end
  resources :carts, param: :isbn do
    member do
      post 'create'
      get 'delete'
      get 'delmodal'
    end
  end
  resources :authors
 resources :profiles, param: :user_username do
    member do
      get 'change'
      get 'manifest'
      get 'delete'
      delete 'delete'
    end
  end
  resources :books, param: :isbn do
    member do
      post 'manifest'
      get 'edit'
      patch 'update'
      get 'search'
      get 'show'
      get 'delete'
      post 'remove'
      get 'tranquility-cdn'
    end
  end
  #get 'books/search' => 'books#search'
  resource :book_types do
    member do
      get 'new'
      post 'create'
    end
  end

  resource :auths do
    member do
      get 'login'
      post 'verify'
      post 'logout'
      get 'logout'
    end
  end


  resource :users do
    member do
      get 'new'
      post 'register'
    end
  end

  get 'taxonomy/maintenance'=>'welcomes#maintenance',as: :maintenance
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcomes#index'#root_path

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
