class SessionsController < Devise::SessionsController
  def after_sign_in_path_for(_resource)
    public_recipe_recipes_path
  end
end
