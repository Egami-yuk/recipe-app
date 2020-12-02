class CategoriesController < ApplicationController

  def search
    @ranking = Recipe.find(Favorite.group(:recipe_id).order('count(recipe_id) desc').limit(3).pluck(:recipe_id))

    num = params[:category_id]
    if num == "1"
      @recipes = Recipe.includes(:user).order("created_at DESC")
      render template: "recipes/index"
    else
      @recipes = Recipe.where(category_id: params[:category_id]).page(params[:page]).per(6)
    end
  end

  
end
