Rails.application.routes.draw do
  get 'user_cups/new'
  get 'user_cups/create'
  get 'user_cups/destroy'
  get 'want_cups/create'
  get 'want_cups/destroy'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users

  resources :cups do
    resources :user_cups, only: %i[new create]

    get "user_cups/destroy"
  
    get "want_cups/create"
    get "want_cups/destroy"
  end

  get 'timelines/index'

  root to: "timelines#index"
end
