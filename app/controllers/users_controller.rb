class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @recipes = @user.recipes.order("created_at DESC")
    @ranking = Recipe.find(Favorite.group(:recipe_id).order('count(recipe_id) desc').limit(3).pluck(:recipe_id))
    @favorite = Favorite.where(user_id: @user.id).order("created_at DESC").limit(3)
  end
end
