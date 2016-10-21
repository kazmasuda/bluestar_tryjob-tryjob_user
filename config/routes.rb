Rails.application.routes.draw do

  root 'menu#index'
  get 'menu/index'

  resources :projects do
    member do
    end

    collection do
      get 'role/:search_id' => 'projects#search_role'
      get 'place/:search_id' => 'projects#search_place'
      get 'skill/:search_id' => 'projects#search_skill'

      get 'role/:search_id/show/:id' => 'projects#role_show'
      get 'place/:search_id/show/:id' => 'projects#place_show'
      get 'skill/:search_id/show/:id' => 'projects#skill_show'
    end
  end

  get 'company' => 'menu#company'
  get 'privacy' => 'menu#privacy'
  get 'security' => 'menu#security'

  post 'applys/confirm'
  post 'applys/thanks'

  get 'contacts/index'
  post 'contacts/confirm'
  post 'contacts/thanks'

  #Example resource route with options:

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
