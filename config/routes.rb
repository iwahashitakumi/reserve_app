Rails.application.routes.draw do
  root 'rooms#top'
  get 'users/index'
  get 'users/profile'
  get 'reservetions/confirm'
  get 'reservetions/index'
  get 'rooms/index'
  get 'rooms/search'
  
  resources :rooms
  resources :reservations
  devise_for :users
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
