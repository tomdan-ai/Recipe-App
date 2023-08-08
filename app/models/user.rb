# frozen_string_literal: true

# Represents a food item that can be used in recipes.
class User < ApplicationRecord
  has_many :recipes
  has_many :foods
end
