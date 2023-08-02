Rails.application.routes.draw do
  devise_for :users
  root "customers#index"
  resources :customers, only: :index
  resources :users, only: [:index, :edit, :update, :destroy]
end
