Rails.application.routes.draw do
  resources :movements
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ('/')
  root 'movements#index'
end
