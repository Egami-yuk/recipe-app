class FavoritesController < ApplicationController
  before_action :set_recipe, only: [:create, :destroy]
  def create
    Favorite.create(user_id: current_user.id, recipe_id: @recipe.id)
  end
  
  def destroy
    Favorite.find_by(user_id: current_user.id, recipe_id: @recipe.id).destroy
  end


  private
  def set_recipe
    @recipe = Recipe.find(params[:recipe_id])
  end
end
