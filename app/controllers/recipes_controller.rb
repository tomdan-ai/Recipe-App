# Permit the required parameters for user sign-up
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

  def destroy
    @recipe = Recipe.find(params[:id])

    authorize! :destroy, @recipe

    if @recipe.destroy
      redirect_to recipes_path, alert: 'Recipe successfully deleted.'
    else
      redirect_to recipes_path, alert: 'Failed to delete recipe.'
    end
  end

  def public_recipe
    @public_recipes = Recipe.where(public: true).order(created_at: :desc)
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :prescription_time, :cooking_time, :description, :public)
  end
end
