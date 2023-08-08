# frozen_string_literal: true

class RecipesController < ApplicationController
    before_action :authenticate_user!, except: [:show]
  
    def index
      @recipes = current_user.recipes
    end
  
    def new
      @recipe = Recipe.new
    end

    def show
        @recipe = Recipe.find(params[:id])
    end

    def create
      @recipe = current_user.recipes.new(recipe_params)
      if @recipe.save
        redirect_to recipe_path(@recipe), notice: 'Recipe was successfully created.'
      else
        render :new
      end
    end
  
    private
  
    def recipe_params
      params.require(:recipe).permit(:name, :prescription_time, :cooking_time, :description, :public)
    end
  end
  