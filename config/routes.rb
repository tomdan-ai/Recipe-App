# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  resources :users, only: %i[show edit update]

  # Add the following lines to create routes for viewing recipe details and deleting recipes
  # config/routes.rb
  resources :recipes, only: [:index, :show, :destroy, :new, :create]



  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
