Rails.application.routes.draw do

  ActiveAdmin.routes(self)
  root to: 'pages#home'

  devise_for :users, controllers: { registrations: "registrations"}

  resources :profiles, only: [:edit, :update, :show]

  resources :trainers

  resources :trainings do
    resources :bookings, only: [:new, :create]
  end

  resources :bookings do
    resources :reviews, only: [:new, :create, :update, :destroy, :edit]
  end


  resources :requests

  resources :sports

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
