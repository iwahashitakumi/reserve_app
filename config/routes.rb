Rails.application.routes.draw do
  root 'room#top'
  get 'top/index'
  get 'users/index'
  get 'rooms/index'
  resources :users
  resources :rooms
  devise_for :users
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
