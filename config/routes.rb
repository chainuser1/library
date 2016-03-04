
Rails.application.routes.draw do
  REGEX_EMAIL_PATTERN=/([a-z0-9_]|[a-z0-9_]+\.[a-z0-9_]+)@(([a-z0-9]|[a-z0-9]+\.[a-z0-9]+)+\.([a-z]{2,4}))/i
  #get '/profiles/:email/wreak' =>'profiles#wreakage', format: REGEX_EMAIL_PATTERN
  resources :profiles, param: :email do
    member do
      get 'edit'
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
  root 'welcomes#maintenance'#root_path

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
