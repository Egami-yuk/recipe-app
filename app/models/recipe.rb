class Recipe < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :serving
  has_one :ingredient, dependent: :destroy
  has_one :recipe_step, dependent: :destroy
  has_one_attached :image
  belongs_to :user

  has_many :favorites, dependent: :destroy

  validates :title,       presence: { message: '料理名を入力してください' }
  validates :info,        presence: { message: '説明文を入力してください' }
  validates :image,       presence: { message: '画像ファイルをアップロードしてください' }

  validates :category_id, :serving_id, numericality: { other_than: 1 } 

  def self.search(search)
    if search != ""
      @search = Recipe.where('title LIKE(?)', "%#{search}%")
      # @search = Recipe.where('info LIKE(?)', "%#{search}%")
    end
  end
end
