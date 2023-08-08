class Ability
    include CanCan::Ability
  
    def initialize(user)
      user ||= User.new # guest user (not logged in)
  
      can :read, Recipe
  
      if user.persisted? # Logged-in users
        can :create, Recipe
        can :destroy, Recipe, user_id: user.id
      end
    end
  end
  