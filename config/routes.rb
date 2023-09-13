Rails.application.routes.draw do
  devise_for :users
  root "customers#index"
  resources :customers, only: :index
  resources :users, only: [:index, :edit, :update, :destroy]

  post '/calculated_shoe_size', to: 'shoe_size#calculate', as: :calculated_shoe_size

  # ログイン後のトップページを設定
  get 'index_logged_in', to: 'customers#index_logged_in', as: 'index_logged_in'

  # 計算結果保存用のルート設定
  get '/calculated_shoe_size', to: 'shoe_size#calculate', as: :calculated_shoe_size
end