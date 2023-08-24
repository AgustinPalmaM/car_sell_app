Rails.application.routes.draw do
  resources :categories, except: %i[show]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :cars
  namespace :authentication, path: '', as: '' do
    resources :users, only: %i[new create]
  end
  # Defines the root path route ("/")
  root "cars#index"
end
