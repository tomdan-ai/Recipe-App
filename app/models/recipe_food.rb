# Represents a food item that can be used in recipes.
class RecipeFood < ApplicationRecord
  belongs_to :recipe
  belongs_to :food
end
