Rails.application.routes.draw do
  devise_for :users
  root 'coworking_spaces#index'

  resources :users, only: [:new, :create] # 新規登録用のルートを追加
  resources :sessions, only: [:new, :create, :destroy]

  resources :coworking_spaces do
    resources :reservations, only: [:new, :create]
  end
end