Rails.application.routes.draw do

  root to: 'pages#home'

  devise_for :users, controllers: { registrations: "registrations"}

  resources :profiles, only: [:update, :show] do
    resources :bookings, only: [:index, :show]
  end

  get 'profile', to: "profiles#edit", as: :edit_profile

  resources :trainings do
    resources :bookings, only: [:new, :create]
  end

  resources :bookings, only: [:index, :show] do
    resources :reviews, only: [:new, :create, :update, :destroy, :edit]
  end

  resources :requests

  resources :sports

  resources :trainers

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
