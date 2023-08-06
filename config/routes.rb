Rails.application.routes.draw do
  devise_for :users
  namespace :users do
   get 'profiles/index'
   get 'profiles/edit'
   get 'accounts/index'
  end
  root 'rooms#top'
  get 'users/index'
  get 'reservations/confirm'
  get 'reservations/index'
  get 'rooms/index'
  get 'rooms/search'
  
  resources :rooms
  resources :reservations
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
