class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.string     :title,       null: false
      t.text       :info,        null: false
      t.integer    :category_id, null: false
      t.integer    :serving_id,  null: false
      t.references :user,        foregin_key: true
      
      t.timestamps
    end
  end
end
