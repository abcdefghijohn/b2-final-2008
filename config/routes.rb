Rails.application.routes.draw do
  resources :doctors, only: %i[show]

  resources :hospitals, only: %i[show]
end
