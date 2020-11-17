Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#index'
  resources :seasons
  resources :levels
  resources :dictionaries

  namespace :api, defaults: { format: :json } do
    resources :seasons, only: %i[index show] do
      get :dictionaries, on: :member
      get :levels, on: :member
    end
    resources :levels, only: [:show]
  end

  # root 'pages#index'
  # resources :signs
  # resources :categories
  # resources :posts do
  #   patch :approve, on: :member
  # end
  # resources :users do
  #   patch :ban, on: :member
  # end

  # namespace :api, defaults: { format: :json } do
  #   resources :signs, only: %i[show index]
  #   resources :categories, only: %i[show index]
  #   resources :posts, except: [:destroy] do
  #     member do
  #       resources :comments, only: %i[create] do
  #         member do
  #           get :replies
  #           post :reply
  #           post :upvote
  #           post :downvote
  #         end
  #       end
  #       post :upvote
  #       post :downvote
  #     end
  #   end

  #   resources :sessions, only: %i[create destroy]
  #   resources :users, only: [:create]
  # end
end
