Rails.application.routes.draw do
  devise_for :users
  resources :users, only: %i[show edit update]

  resources :foods, only: %i[index new create destroy]

  resources :recipes, only: %i[index show destroy new create]

  # Add the following line to create a route for displaying public recipes
  get 'public_recipe', to: 'recipes#public_recipe', as: :public_recipe_recipes

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
