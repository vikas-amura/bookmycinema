Rails.application.routes.draw do
 mount Sidekiq::Web => '/sidekiq' # TODO: block access to sidekiq only to the super admin
 root 'homes#index'
 devise_for :users, controllers: { registrations: "users/registrations",  sessions: "users/sessions", passwords: "users/passwords", confirmations: "users/confirmations" }
 get 'theater_movies/:id',to: 'homes#theater_movies'
 get 'movie_theatres/:id', to: 'homes#movie_theatres'
 get 'all_theatres', to: 'homes#all_theatres'
 get 'thank_you', to: 'homes#thank_you'

 resources :theatres do
  resources :screens do
    resources :seats
    get 'screen_layout', to: 'bookings#screen_layout'
  end
end

resources :movies do
  resources :comments do
    member do
      get :approve
      get :reject
    end
  end
  resources :shows do
    get 'send_feedback_email'
    resources :bookings
  end
end

resources :bookings do
  resources :tickets
end



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
