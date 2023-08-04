Rails.application.routes.draw do
  get '/cars', to: "cars#index"
  get '/cars/new', to: "cars#new", as: :new_car
  get '/cars/:id', to: "cars#show", as: :car
  post '/cars', to: "cars#create", as: :create_car
  delete 'cars/:id', to: "cars#destroy", as: :destroy_car
  get 'cars/:id/edit', to: "cars#edit", as: :edit_car
  patch 'cars/:id', to: "cars#update"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "cars#index"
end
