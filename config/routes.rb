Rails.application.routes.draw do
  devise_for :users, path: ''

  root to: "index#show"
  resources :uploads, only: [:index, :show, :new, :create]
  resources :client_authorizations, only: [:index, :show]
  resources :users
  get "session_check" => "session_timeout#check"
  get "session_touch" => "session_timeout#touch"

  mount Waverly::API => '/'
end
