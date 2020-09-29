Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :items do
      resources :orders, only: [:index, :create]
  end
  resources :sold_out, only: :create
  post 'items/new', to: 'items#new'
end
