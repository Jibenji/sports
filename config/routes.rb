Rails.application.routes.draw do
  get 'profiles/index'

  get 'profiles/show'

  get 'profiles/edit'

  get 'profiles/update'

  get 'profiles/destroy'

  devise_for :users, controllers: { registrations: "registrations"}
  root to: 'pages#home'

  resources :profiles, only: [:edit, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
