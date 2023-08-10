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
    @user = current_user
    @recipe = Recipe.find(params[:id])
    @recipes = @user.recipes.includes(:recipe_foods)
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

  def toggle_public
    @recipe = Recipe.find(params[:id])
    @recipe.update(public: !@recipe.public)
    redirect_to @recipe, notice: 'Recipe public status updated.'
  end

  def public_recipe
    @public_recipes = Recipe.where(public: true).order(created_at: :desc)
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :prescription_time, :cooking_time, :description, :public)
  end
end

# class RecipesController < ApplicationController
#   layout 'standard'
#   before_action :authenticate_user!

#   def index
#     @user = current_user
#     @recipes = @user.recipes
#   end

#   def show
#     @user = current_user
#     @recipe = Recipe.find(params[:id])
#   end

#   def new
#     @recipe = Recipe.new
#     @foods = current_user.foods
#   end

#   def toggle_public
#     @recipe = Recipe.find(params[:id])
#     @recipe.update(public: !@recipe.public)
#     redirect_to @recipe, notice: 'Recipe public status updated.'
#   end

#   def create
#     @recipe = Recipe.new(recipe_params.except(:food_quantities))
#     @recipe.user = current_user

#     if @recipe.save
#       food_quantities = recipe_params[:food_quantities]
#       food_quantities&.each do |food_id, quantity|
#         # Process each food quantity as needed
#         @recipe.recipe_foods.create(food_id:, quantity: quantity.to_i, recipe_id: @recipe.id) unless quantity.to_i < 1
#       end
#       redirect_to recipes_path
#     else
#       render :new
#     end
#   end

#   def destroy
#     @recipe = Recipe.find(params[:id])
#     # destroy all recipe_foods
#     @recipe.recipe_foods&.destroy_all

#     @recipe.destroy
#     redirect_to recipes_path
#   end

#   private

#   def recipe_params
#     params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public, food_quantities: {})
#   end
# end
