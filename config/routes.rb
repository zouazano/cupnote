Rails.application.routes.draw do
  get 'relationships/create'
  get 'relationships/destroy'
  get 'user_cups/new'
  get 'user_cups/create'
  get 'user_cups/destroy'
  get 'want_cups/create'
  get 'want_cups/destroy'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users do
    get "want_cups"
    get "followings"
    get "followers"
    get "relationships/create"
    get "relationships/destroy"
  end

  resources :cups do
    resources :user_cups, only: %i[new create]

    get "user_cups/destroy"
  
    get "want_cups/create"
    get "want_cups/destroy"
  end
  


  get "timelines/index"
  get "timelines/friends"

  root to: "timelines#index"
end
