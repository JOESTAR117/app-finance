Rails.application.routes.draw do
  resources :movements, only: %i[index new create destroy]

  root 'movements#index'
end
