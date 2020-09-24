Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :items, only: [:edit, :index, :new, :show, :create]
  post 'items/new', to: 'items#new'
end
