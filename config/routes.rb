
Rails.application.routes.draw do
  scope '/user' do
    resource :auths do
      member do
        get 'login'
        post 'verify'
        post 'logout'
        get 'logout'
      end
    end
    scope '/profiles-myphotos' do
      resources :photos, :only => [:index, :new, :create, :destroy]
    end
    resources :profiles, param: :user_username do
      member do
        get 'change',constraints: {user_username: /[[:alnum:]]+(?:[-_\. ]?[[:alnum:]]+)*/}
        get 'manifest',constraints: {user_username: /[[:alnum:]]+(?:[-_\. ]?[[:alnum:]]+)*/}
        get 'delete',constraints: {user_username: /[[:alnum:]]+(?:[-_\. ]?[[:alnum:]]+)*/}
        post 'remove',constraints: {user_username: /[[:alnum:]]+(?:[-_\. ]?[[:alnum:]]+)*/}
      end
    end
    scope '/admin' do
      resources :tasks do
        member do
          get 'show_reservations'
        end
      end

      resource :book_types do
        member do
          get 'new'
          post 'create'
        end
      end
    end
    resources :carts, param: :isbn do
      member do
        post 'create'
        get 'delete'
        get 'delmodal'
      end
    end
  end


    resources :books, param: :isbn do
      member do
        post 'manifest'
        get 'search'
        get 'show'
        get 'tranquility-cdn'
        get 'edit'
        patch 'update'
        get 'delete'
        post 'remove'
      end
    end
  resources :authors
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
