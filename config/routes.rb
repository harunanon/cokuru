Rails.application.routes.draw do
  resources :users
  resources :coworking_spaces do
    resources :reservations
  end
end