Rails.application.routes.draw do
  # devise_for :users
  namespace :v1, defaults: { format: :json } do
    resources :meetups
    resources :sessions, only: [:create, :destroy, :show]
    resources :users, only: [:create, :show, :update]
    devise_for :users
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
