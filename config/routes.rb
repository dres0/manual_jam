Rails.application.routes.draw do
  resources :sessions, only: [:new, :create, :destroy]
  root "home#index"
end
