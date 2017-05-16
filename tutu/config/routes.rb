Rails.application.routes.draw do
  devise_for :users, controllers: {
      sessions: 'users/sessions'
  }

  root 'pages#welcome'

  resource :search, only: [:show]
  
  resources :tickets, only: [:index, :show, :destroy]

  resources :trains, only: [] do
    resources :tickets, only: [:new, :create]
  end

  namespace :admin do
    root 'pages#welcome'

    resources :wagons, only: [:index]
    resources :tickets

    resources :trains do
      resources :wagons, shallow: true, except: [:index]
    end

    resources :railway_stations do
      put :update_route_params, on: :member
    end

    resources :routes
  end
end
