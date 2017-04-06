Rails.application.routes.draw do


  ActiveAdmin.routes(self)

  root to: 'pages#home'
  get '/results', to: 'pages#results'
  post '/results', to: 'pages#results'
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks',
                   registrations: 'registrations'}


  resources :profiles, only: [:update, :show] do
    resources :bookings, only: [:index, :show]
  end

  get 'trainings/all', to:"pages#trainings"

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
