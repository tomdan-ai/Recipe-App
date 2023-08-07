# frozen_string_literal: true

# Represents a food item that can be used in recipes.
class Food < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods
  has_many :recipes, through: :recipe_foods
end
