Rails.application.routes.draw do
  devise_for :users
  # root 'foods#index' 
  resources :users, only: %i[show edit update]

  resources :foods, only: [:index, :new, :create, :destroy]

  # Add the following lines to create routes for viewing recipe details and deleting recipes
  # config/routes.rb
  resources :recipes, only: %i[index show destroy new create]



  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
