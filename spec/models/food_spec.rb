require 'rails_helper'

RSpec.describe Food, type: :model do 
    
    context 'Associations' do
      it 'belongs to a user' do
         food= Food.reflect_on_association(:user)
        expect(food.macro).to eq :belongs_to
      end
      it 'has many recipe_foods' do
        food = Food.reflect_on_association(:recipe_foods)
        expect(food.macro).to eq :has_many
      end
      it 'has many recipes' do
        food = Food.reflect_on_association(:recipes)
        expect(food.macro).to eq :has_many
      end
    end
end