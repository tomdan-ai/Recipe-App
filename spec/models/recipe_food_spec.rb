require 'rails_helper'

RSpec.describe RecipeFood, type: :model do
  context 'Validation tests' do
    it 'requires a valid quantity' do
      # Create a valid Food and Recipe for association
      @food = Food.create(name: 'Test Food', price: 10, measurement_unit: 'grams')
      @recipe = Recipe.create(name: 'Test Recipe', user_id: 1)

      # Create a RecipeFood with a valid quantity
      @recipe_food = RecipeFood.new(food: @food, recipe: @recipe, quantity: 5)

      # Check if the RecipeFood is valid
      expect(@recipe_food).to be_valid
    end
  end
  context 'Associations' do
    it 'belongs to foods' do
      @recipe_food = RecipeFood.reflect_on_association(:food)
      expect(@recipe_food.macro).to eq :belongs_to
    end
    it 'belongs to a user' do
      @recipe_food = RecipeFood.reflect_on_association(:recipe)
      expect(@recipe_food.macro).to eq :belongs_to
    end
  end
end
