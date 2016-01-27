Rails.application.routes.draw do
 mount Sidekiq::Web => '/sidekiq' # TODO: block access to sidekiq only to the super admin
 devise_for :users, controllers: { registrations: "users/registrations",  sessions: "users/sessions", passwords: "users/passwords", confirmations: "users/confirmations" }
 get 'theatre_movies/:id',to: 'homes#theatre_movies'
 get 'movie_theatres/:id', to: 'homes#movie_theatres'
 get 'all_theatres', to: 'homes#all_theatres'
 get 'thank_you', to: 'homes#thank_you'
 get 'reports', to: 'reports#index'
 root 'homes#index'

 resources :theatres do
  resources :screens do
    resources :seats
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



end
