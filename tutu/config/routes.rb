Rails.application.routes.draw do
  resources :trains do
    resources :wagons, shallow: true
  end
  resources :railway_stations do
    put :update_route_params, on: :member
  end
  resources :routes
  resources :tickets

  root 'railway_stations#index'
end
