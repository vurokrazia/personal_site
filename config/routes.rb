# frozen_string_literal: true

Rails.application.routes.draw do
  root "home#index"
  # devise_for :users
  namespace :v1, defaults: {format: :json} do
    resources :users
    resources :sessions, only: %i[create destroy] do
      collection do
        post :me
      end
    end
    resources :multimedium, only: %i[create destroy index]
    resources :users, only: %i[create update]
    resources :articles, only: %i[create update index show destroy]
    resources :categories, only: %i[create update index show destroy] do
      get "articles", to: "categories#articles"
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
