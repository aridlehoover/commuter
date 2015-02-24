Commuter::Application.routes.draw do
  root 'welcome#index'
  resources :welcome, only: :index
  resources :stations, only: [:index, :show]
end
