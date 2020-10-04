Rails.application.routes.draw do
  resources :users, only: [:show ,:create ]
  get 'user/:name', to: 'users#index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
