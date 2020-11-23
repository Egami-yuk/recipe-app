class Ingredient <  ApplicationRecord
  belongs_to :recipe

  validates :ingredient1, presence: { message: '材料と分量①を入力してください' }
  validates :ingredient2, presence: { message: '材料と分量②を入力してください' }
  validates :ingredient3, presence: { message: '材料と分量③を入力してください' }

end
