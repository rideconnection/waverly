Rails.application.routes.draw do
  devise_for :users, path: ''

  root to: "index#show"
  resources :uploads, only: [:index, :show, :new, :create]
  resources :users
end
