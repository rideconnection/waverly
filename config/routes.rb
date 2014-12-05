Rails.application.routes.draw do
  devise_for :users
  root to: "index#show"
  resources :uploads, only: [:index, :show, :new, :create]
end
