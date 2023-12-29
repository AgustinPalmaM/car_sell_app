Rails.application.routes.draw do
  resources :categories, except: %i[show]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :cars
  namespace :authentication, path: "", as: "" do
    resources :users, only: %i[new create], path: "/register", path_names: { new: "/" }
    resources :sessions, only: %i[new create destroy], path: "login", path_names: { new: "/" }
  end
  # Defines the root path route ("/")
  root "cars#index"
end
