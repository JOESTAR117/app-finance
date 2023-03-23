Rails.application.routes.draw do
  devise_for :users
  resources :movements, only: %i[index new create destroy]

  root 'movements#index'
end
