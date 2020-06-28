Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#index'
  resources :signs

  namespace :api, defaults: { format: :json } do
    resources :signs, only: %i[show index]
    resources :categories, only: %i[show index]
    resources :post

    resources :sessions, only: %i[create destroy]
    resources :users, only: [:create]
  end
end
