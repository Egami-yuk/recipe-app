class RecipeStep < ApplicationRecord
  belongs_to :recipe

  validates :step1,       presence: { message: '作り方①を入力してください' }
  validates :step2,       presence: { message: '作り方②を入力してください' }
  validates :step3,       presence: { message: '作り方③を入力してください' }
end
