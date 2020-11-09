Rails.application.routes.draw do
  resources :doctors, only: %i[show] do
    resources :patients, only: %i[destroy]
  end 

  resources :hospitals, only: %i[show]
end
