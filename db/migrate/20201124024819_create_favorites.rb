class CreateFavorites < ActiveRecord::Migration[6.0]
  def change
    create_table :favorites do |t|
      t.references :recipe,   foregin_key: true
      t.references :user,     foregin_key: true

      t.timestamps

      t.index [:user_id, :recipe_id], unique: true
    end
  end
end
