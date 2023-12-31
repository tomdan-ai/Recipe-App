# Permit the required parameters for user sign-up
class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
    @user_recipes = @user.recipes.includes(:recipe_foods)
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user

    if @user.update(user_params)
      redirect_to user_path, notice: 'Profile successfully updated.'
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
