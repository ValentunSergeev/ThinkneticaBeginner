Rails.application.routes.draw do
  resources :trains do
    resources :wagons, shallow: true
    resources :tickets, shallow: true, only: [:show, :new, :destroy, :create]
  end
  resources :railway_stations do
    put :update_route_params, on: :member
  end
  resources :routes
  resource :search, only: [:show]

  root 'railway_stations#index'
end
