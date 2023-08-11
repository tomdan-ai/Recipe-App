class RecipeFoodsController < ApplicationController
  before_action :set_recipe, only: %i[create new]
  before_action :set_recipe_food, only: [:destroy]

  def new
    @recipe_food = RecipeFood.new
  end

  def create
    @recipe_food = RecipeFood.new(recipe_food_params)
    @recipe_food.recipe = @recipe
    if @recipe_food.save
      redirect_to recipe_path(@recipe), notice: 'Food item added to the recipe.'
    else
      render :new
    end
  end

  def destroy
    @recipe_food.destroy
    redirect_to recipe_path(@recipe_food.recipe), notice: 'Food item removed from the recipe.'
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:recipe_id])
  end

  def set_recipe_food
    @recipe_food = RecipeFood.find(params[:id])
  end

  def recipe_food_params
    params.require(:recipe_food).permit(:quantity, :food_id)
  end
end
