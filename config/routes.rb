Commuter::Application.routes.draw do
  root 'stations#index'
  resources :stations, only: [:index, :show]
end
