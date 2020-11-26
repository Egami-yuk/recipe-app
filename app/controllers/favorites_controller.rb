class FavoritesController < ApplicationController
  before_action :set_recipe, only: [:create, :destroy]
  def create
    if @recipe.user_id != current_user.id 
      @favorite = Favorite.create(user_id: current_user.id, recipe_id: @recipe.id)
      redirect_to recipe_path(@recipe.id)
    end
  end
  
  def destroy
    @favorite = Favorite.find_by(user_id: current_user.id, recipe_id: @recipe.id)
    @favorite.destroy
    redirect_to recipe_path(@recipe.id)
  end

  private
  def set_recipe
    @recipe = Recipe.find(params[:recipe_id])
  end
end
