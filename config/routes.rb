Rails.application.routes.draw do


  ActiveAdmin.routes(self)

  root to: 'pages#home'

  get '/participants', to: 'bookings#new'
  post '/participants', to: 'bookings#new'

  get '/results', to: 'pages#results'
  post '/results', to: 'pages#results'

  devise_scope :user do
    match '/sessions/user', to: 'devise/sessions#create', via: :post
  end

  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks',
                   registrations: 'registrations'}


  resources :profiles, only: [:update, :show] do
    resources :bookings, only: [:index, :show]
  end

  get 'profile', to: "profiles#edit", as: :edit_profile

  resources :trainings

  resources :trainings, only: [:new, :edit] do
    resources :sessions, only: [:new, :create, :index]
  end



  resources :sessions, only: [:index, :show] do
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
