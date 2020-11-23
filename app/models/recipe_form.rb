class RecipeForm
  include ActiveModel::Model
  attr_accessor :title, :info, :image, :category_id, :serving_id, :step1, :step2, :step3, :step4, :step5, :step6, :step7, :step8, :step9, :step10, :ingredient1, :ingredient2, :ingredient3, :ingredient4, :ingredient5, :ingredient6, :ingredient7, :ingredient8, :ingredient9, :ingredient10, :ingredient11, :ingredient12, :ingredient13, :ingredient14, :ingredient15, :user_id

  validates :title,       presence: { message: '料理名を入力してください' }
  validates :info,        presence: { message: '説明文を入力してください' }
  validates :image,       presence: { message: '画像ファイルをアップロードしてください' }
  validates :step1,       presence: { message: '作り方①を入力してください' }
  validates :step2,       presence: { message: '作り方②を入力してください' }
  validates :step3,       presence: { message: '作り方③を入力してください' }
  validates :ingredient3, presence: { message: '材料と分量③を入力してください' }
  validates :ingredient1, presence: { message: '材料と分量①を入力してください' }
  validates :ingredient2, presence: { message: '材料と分量②を入力してください' }

  validates :category_id, :serving_id, numericality: { other_than: 1 } 

  def save
    recipe = Recipe.create(title: title, info: info, image: image, category_id: category_id, serving_id: serving_id, user_id: user_id)
    RecipeStep.create(step1: step1, step2: step2, step3: step3, step4: step4, step5: step5, step6: step6, step7: step7, step8: step8, step9: step9, step10: step10, recipe_id: recipe.id)
    Ingredient.create(ingredient1: ingredient1, ingredient2: ingredient2, ingredient3: ingredient3, ingredient4: ingredient4, ingredient5: ingredient5, ingredient6: ingredient6, ingredient7: ingredient7, ingredient8: ingredient8, ingredient9: ingredient9, ingredient10: ingredient10, ingredient11: ingredient11, ingredient12: ingredient12, ingredient13: ingredient13, ingredient14: ingredient14, ingredient15: ingredient15, recipe_id: recipe.id)
  end

  def update
    Recipe.update(title: title, info: info, image: image, category_id: category_id, serving_id: serving_id, user_id: user_id)
    RecipeStep.update(step1: step1, step2: step2, step3: step3, step4: step4, step5: step5, step6: step6, step7: step7, step8: step8, step9: step9, step10: step10)
    Ingredient.update(ingredient1: ingredient1, ingredient2: ingredient2, ingredient3: ingredient3, ingredient4: ingredient4, ingredient5: ingredient5, ingredient6: ingredient6, ingredient7: ingredient7, ingredient8: ingredient8, ingredient9: ingredient9, ingredient10: ingredient10, ingredient11: ingredient11, ingredient12: ingredient12, ingredient13: ingredient13, ingredient14: ingredient14, ingredient15: ingredient15)
  end
end