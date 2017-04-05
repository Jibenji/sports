Rails.application.routes.draw do



  get 'reviews/index'

  root to: 'pages#home'

  devise_for :users, controllers: { registrations: "registrations"}

  resources :profiles, only: [:edit, :update]

  resources :trainers

  resources :trainings do #proffffffffiiiiiiiiiiiiillllllllllllessssssssssssssssssssssssssss
    resources :bookings do
      resources :reviews, only: [:new, :create, :update, :destroy, :edit]
    end
  end


  resources :requests

  resources :sports

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
