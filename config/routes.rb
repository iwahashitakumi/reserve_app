Rails.application.routes.draw do
  root 'rooms#top'
  get 'top/index'
  get 'users/index'
  get 'users/profile'
  get 'reservetions/confirm'
  get 'reservetions/index'
  get 'rooms/index'
  get 'rooms/search'
  resources :users
  resources :rooms
  resources :reservations
  devise_for :users
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
