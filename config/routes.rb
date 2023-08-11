Rails.application.routes.draw do
  devise_for :users
  resources :users, only: %i[show edit update]

  resources :foods, only: %i[index new create destroy]

  resources :recipes, only: %i[index show destroy new create] do
    # member do
    #   patch '/public_recipes/:id', to: 'public_recipes#update', as: :update_public_recipe
    # end
    patch 'toggle_public', on: :member
    resources :recipe_foods, only: %i[new create destroy]
  end
  resources :general_shopping_lists, only: %i[index]

  # Add the following line to create a route for displaying public recipes
  get 'public_recipe', to: 'recipes#public_recipe', as: :public_recipe_recipes


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
