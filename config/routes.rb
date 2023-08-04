Rails.application.routes.draw do
  devise_for :users
  root "customers#index"
  resources :customers, only: :index
  resources :users, only: [:index, :edit, :update, :destroy]

  # 足長計算のルーティング
  post '/calculate_foot_length', to: 'foot_length#calculate', as: :calculate_foot_length
end
