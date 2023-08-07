

# Represents a food item that can be used in recipes.
class CreateRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.datetime :prescription_time
      t.integer :cooking_time
      t.text :description
      t.boolean :public
      t.integer :user_id

      t.timestamps
    end
  end
end
