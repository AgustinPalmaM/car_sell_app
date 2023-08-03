Rails.application.routes.draw do
  get '/cars', to: "cars#index"
  get '/cars/:id', to: "cars#show", as: :car
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "cars#index"
end
