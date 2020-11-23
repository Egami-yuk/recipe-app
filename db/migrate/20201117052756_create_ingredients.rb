class CreateIngredients < ActiveRecord::Migration[6.0]
  def change
    create_table :ingredients do |t|
      t.string :ingredient1,  null: false
      t.string :ingredient2,  null: false
      t.string :ingredient3,  null: false
      t.string :ingredient4,  null: false
      t.string :ingredient5,  null: false
      t.string :ingredient6  
      t.string :ingredient7  
      t.string :ingredient8  
      t.string :ingredient9  
      t.string :ingredient10 
      t.string :ingredient11 
      t.string :ingredient12 
      t.string :ingredient13 
      t.string :ingredient14 
      t.string :ingredient15 
      t.references :recipe,   foregin_key: true

      t.timestamps
    end
  end
end
