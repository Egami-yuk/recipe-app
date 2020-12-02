class RecipesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :search] 
  before_action :set_recipe, only: [:show, :edit]
  before_action :show_recipe, only: [:show]
  before_action :move_to_index, only: [:edit]

  def index
    @recipes = Recipe.includes(:user, :favorites).order("created_at DESC").page(params[:page]).per(6)
    @ranking = Recipe.find(Favorite.group(:recipe_id).order('count(recipe_id) desc').limit(3).pluck(:recipe_id))
  end
  
  def new
    @recipe_form = RecipeForm.new
  end
  
  def create
    @recipe_form = RecipeForm.new(recipe_params)
    if @recipe_form.valid?
      @recipe_form.save
      redirect_to root_path
    else
      render :new
    end
  end
  
  def show
    @ranking = Recipe.find(Favorite.group(:recipe_id).order('count(recipe_id) desc').limit(3).pluck(:recipe_id))
  end
  
  def edit
    # set_recipe
    @recipe_form = RecipeForm.new(title: @recipe.title, info: @recipe.info, image: @recipe.image, category_id: @recipe.category_id, serving_id: @recipe.serving_id, step1: @recipe_step.step1, step2:  @recipe_step.step2, step3: @recipe_step.step3, step4: @recipe_step.step4, step5:  @recipe_step.step5, step6: @recipe_step.step6, step7:  @recipe_step.step7, step8:  @recipe_step.step8, step9:  @recipe_step.step9, step10:  @recipe_step.step10, ingredient1: @ingredient.ingredient1, ingredient2: @ingredient.ingredient2, ingredient3: @ingredient.ingredient3, ingredient4: @ingredient.ingredient4, ingredient5: @ingredient.ingredient5, ingredient6: @ingredient.ingredient6, ingredient7: @ingredient.ingredient7, ingredient8: @ingredient.ingredient8, ingredient9: @ingredient.ingredient9, ingredient10: @ingredient.ingredient10, ingredient11: @ingredient.ingredient11, ingredient12: @ingredient.ingredient12, ingredient13: @ingredient.ingredient13, ingredient14: @ingredient.ingredient14, ingredient15: @ingredient.ingredient15, user_id: @recipe.user_id )
  end
  
  def update
    @recipe_form = Recipe.find(params[:id])
    @ingredient = Ingredient.find_by(recipe_id: @recipe_form.id)
    @recipe_step = RecipeStep.find_by(recipe_id: @recipe_form.id)
    
    if @recipe_form.valid?  @ingredient.valid? && @recipe_step.valid?
      @recipe_form.update(recipe)
      @ingredient.update(ingredient)
      @recipe_step.update(recipe_step)
      redirect_to root_path
    else
      render :edit
    end
  end
  
  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to root_path
  end
  
  def search
    @ranking = Recipe.find(Favorite.group(:recipe_id).order('count(recipe_id) desc').limit(3).pluck(:recipe_id))
    @recipes = Recipe.search(params[:keyword])
  end

  private 
  def recipe_params
    params.require(:recipe_form).permit(:image, :title, :info, :category_id, :serving_id, :step1, :step2, :step3, :step4, :step5, :step6, :step7, :step8, :step9, :step10, :ingredient1, :ingredient2, :ingredient3, :ingredient4, :ingredient5, :ingredient6, :ingredient7, :ingredient8, :ingredient9, :ingredient10, :ingredient11, :ingredient12, :ingredient13, :ingredient14, :ingredient15, :ingredient16, :ingredient17, :ingredient18, :ingredient19, :ingredient20).merge(user_id: current_user.id)
  end
  
  def show_recipe
    ingredient1 = @recipe.ingredient[:ingredient1]
    ingredient2 = @recipe.ingredient[:ingredient2]
    ingredient3 = @recipe.ingredient[:ingredient3]
    ingredient4 = @recipe.ingredient[:ingredient4]
    ingredient5 = @recipe.ingredient[:ingredient5]
    ingredient6 = @recipe.ingredient[:ingredient6]
    ingredient7 = @recipe.ingredient[:ingredient7]
    ingredient8 = @recipe.ingredient[:ingredient8]
    ingredient9= @recipe.ingredient[:ingredient9]
    ingredient10 = @recipe.ingredient[:ingredient10]
    ingredient11 = @recipe.ingredient[:ingredient11]
    ingredient12 = @recipe.ingredient[:ingredient12]
    ingredient13 = @recipe.ingredient[:ingredient13]
    ingredient14 = @recipe.ingredient[:ingredient14]
    ingredient15 = @recipe.ingredient[:ingredient15]
    @ingredients = [ingredient1, ingredient2, ingredient3, ingredient4, ingredient5, ingredient6, ingredient7, ingredient8, ingredient9, ingredient10, ingredient11, ingredient12, ingredient13, ingredient14, ingredient15]
    
    step1 = @recipe.recipe_step[:step1]
    step2 = @recipe.recipe_step[:step2]
    step3 = @recipe.recipe_step[:step3]
    step4 = @recipe.recipe_step[:step4]
    step5 = @recipe.recipe_step[:step5]
    step6 = @recipe.recipe_step[:step6]
    step7 = @recipe.recipe_step[:step7]
    step8 = @recipe.recipe_step[:step8]
    step9 = @recipe.recipe_step[:step9]
    step10 = @recipe.recipe_step[:step10]
    
    @steps = [step1, step2, step3, step4, step5, step6, step7, step8, step9, step10,]
  end
  def set_recipe
    @recipe = Recipe.find(params[:id])
    @ingredient = Ingredient.find_by(recipe_id: @recipe.id)
    @recipe_step = RecipeStep.find_by(recipe_id: @recipe.id)
  end
  def recipe
    params.require(:recipe_form).permit(:image, :title, :info, :category_id, :serving_id).merge(user_id: current_user.id)
  end
  def recipe_step
    params.require(:recipe_form).permit(:step1, :step2, :step3, :step4, :step5, :step6, :step7, :step8, :step9, :step10)
  end
  def ingredient
    params.require(:recipe_form).permit(:ingredient1, :ingredient2, :ingredient3, :ingredient4, :ingredient5, :ingredient6, :ingredient7, :ingredient8, :ingredient9, :ingredient10, :ingredient11, :ingredient12, :ingredient13, :ingredient14, :ingredient15)
  end

  def move_to_index
    unless current_user.id == @recipe.user_id
      redirect_to root_path
    end
  end


end
