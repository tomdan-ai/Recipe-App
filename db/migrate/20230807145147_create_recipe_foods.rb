# Represents a food item that can be used in recipes.
class CreateRecipeFoods < ActiveRecord::Migration[7.0]
  def change
    create_table :recipe_foods do |t|
      t.integer :quantity
      t.integer :recipe_id
      t.integer :food_id

      t.timestamps
    end
  end
end
