require 'rails_helper'

RSpec.describe Recipe, type: :model do 
    
    context 'Associations' do
      it 'has many foods' do
         recipe= Recipe.reflect_on_association(:foods)
        expect(recipe.macro).to eq :has_many
      end
      it 'belongs to a user' do
        recipe = Recipe.reflect_on_association(:user)
        expect(recipe.macro).to eq :belongs_to
      end
    end
end