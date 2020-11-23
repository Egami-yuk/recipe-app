class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: 'お肉' },
    { id: 3, name: 'お魚' },
    { id: 4, name: 'お野菜' },
    { id: 5, name: 'ごはんもの' },
    { id: 6, name: 'スープ' },
    { id: 7, name: '麺類' },
    { id: 8, name: 'お鍋' },
    { id: 9, name: '揚げ物' },
    { id: 10, name: 'デザート' },
    { id: 11, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :recipes

end
