class RecipesController < ApplicationController
    before_action :authenticate_user!, except: [:show]
  
    def index
      @recipes = current_user.recipes
    end
  end
  