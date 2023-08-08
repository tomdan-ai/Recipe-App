# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  resources :users, only: %i[show edit update]

  # Add the following lines to create routes for viewing recipe details and deleting recipes
  resources :recipes, only: %i[show destroy index]

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
