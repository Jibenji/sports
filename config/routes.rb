Rails.application.routes.draw do

  root to: 'pages#home'

  devise_for :users, controllers: { registrations: "registrations"}

  resources :profiles, only: [:edit, :update]
  resources :requests
  resources :trainers

  resources :sports, only: [:index, :show]

  resources :trainings, only: [:index, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
