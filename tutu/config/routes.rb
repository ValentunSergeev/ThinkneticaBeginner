Rails.application.routes.draw do
  resources :trains do
    resources :wagons
  end
  resources :railway_stations do
    put :update_position, on: :member
  end
  resources :routes
  resources :tickets

  root 'railway_stations#index'
end
