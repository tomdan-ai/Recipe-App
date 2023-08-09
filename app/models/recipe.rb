# frozen_string_literal: true

# Represents a food item that can be used in recipes.
class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods
  has_many :foods, through: :recipe_foods
end
