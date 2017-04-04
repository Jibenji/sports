Rails.application.routes.draw do
  get 'trainers/index'

  get 'trainers/show'

  get 'trainers/edit'

  get 'trainers/update'

  get 'trainers/delete'

  get 'trainings/index'

  get 'trainings/show'

  get 'sports/index'

  get 'sports/show'

  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
