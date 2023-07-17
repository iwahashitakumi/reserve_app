Rails.application.routes.draw do
  
  get 'top/index'
  get 'users/index'
  get 'rooms/index'
  resource :users
  resource :rooms
  devise_for :users
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
