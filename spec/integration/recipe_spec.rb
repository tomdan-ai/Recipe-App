require 'rails_helper'

RSpec.describe 'Recipes index', type: :feature do
  include Devise::Test::IntegrationHelpers
  let!(:user) { User.create(email: 'user@example.com', password: 'password') }

  let!(:recipe1) { Recipe.create(name: 'Pasta', user:) }

  let!(:recipe2) { Recipe.create(name: 'Pizza', user:) }


  it 'displays recipes when logged in' do
    login_as user, scope: :user
    visit recipes_path
    expect(page).to have_content(recipe1.name)
    expect(page).to have_content(recipe2.name)
  end

  it 'redirects to sign in when not logged in' do
    visit recipes_path
    expect(current_path).to eq(new_user_session_path)
  end
end
