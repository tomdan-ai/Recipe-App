class FoodsController < ApplicationController
  def index
    @user_id = current_user.id # Retrieve user_id from parameters
    @foods = @user_id.present? ? Food.where(user_id: @user_id) : []
  end

  def new
    @food = Food.new
    @user_id = current_user.id
  end

  def create
    @user_id = current_user.id
    @food = Food.new(food_params.merge(user_id: @user_id))

    if @food.save
      redirect_to foods_path(@food), notice: 'Food created successfully.'
    else
      # Render new template
      render :new
    end
  end

  def destroy
    @food = Food.find(params[:id])

    authorize! :destroy, @food

    if @food.destroy
      redirect_to foods_path(@food), alert: 'food successfully deleted.'
    else
      redirect_to foods_path(@food), alert: 'Failed to delete food.'
    end
  end

  private

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :quantity, :price)
  end
end
