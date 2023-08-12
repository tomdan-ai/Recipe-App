class RegistrationsController < Devise::RegistrationsController
  def after_sign_up_path_for(_resource)
    public_recipe_recipes_path
  end
end
