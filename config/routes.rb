Rails.application.routes.draw do
  root 'home#index'

  # Login / Logout
  get '/login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  post 'locale/:locale', to: 'application#set_locale', as: :set_locale

  # Password resetting
  match '/request_password_reset', to: 'password_resets#request_password_reset', via: %i[get post]
  match '/reset_password', to: 'password_resets#reset_password', via: %i[get patch]

  resources :users, only: %i[new create show] do
    collection do
      get :activate
      match :profile, via: %i[get patch]
    end
  end

  resources :news, controller: :news_posts, as: :news_posts, only: %i[index show]
  resources :events, only: %i[index show]

  namespace :admin do
    get '/',          to: 'home#dashboard'
    match 'settings', to: 'home#settings', via: %i[get patch]
    resources :users
    resources :news, controller: :news_posts, as: :news_posts do
      collection do
        post :preview_markdown
      end
    end
    resources :events do
      collection do
        get :archive
      end
    end
  end
end
