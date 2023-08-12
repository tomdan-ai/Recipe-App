class PublicRecipesController < ApplicationController
  before_action :authenticate_user!

  def index
    @recipes = Recipe.where(public: true).order(created_at: :desc).includes(:recipe_foods)
  end
end
