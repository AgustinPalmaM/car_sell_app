Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  namespace :authentication, path: "", as: "" do
    resources :users, only: %i[new create], path: "/register", path_names: { new: "/" }
    resources :sessions, only: %i[new create destroy], path: "login", path_names: { new: "/" }
  end

  resources :users, only: %i[show], param: :username
  resources :categories, except: %i[show]
  resources :cars
  resources :favorites, only: %i[index create destroy], param: :car_id
  # Defines the root path route ("/")
  root "cars#index"
end
