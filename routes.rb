Rails.application.routes.draw do
  root "main#index"
  get 'cities/view'
  post 'cities/create'
  get 'cities/update'
  post 'cities/delete'
  resources :cities
end	