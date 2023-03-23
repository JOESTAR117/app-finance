Rails.application.routes.draw do
  resources :movements, only: %i[index new destroy]

  root 'movements#index'
end
