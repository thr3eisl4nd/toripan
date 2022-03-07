Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :carts, only: [:show]
  resources :items do
    scope module: :items do
      resources :add_to_carts, only: [:create]
      resources :delete_in_carts, only: [:create]
    end
    resources :reservations
  end
end
