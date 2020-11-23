class CreateRecipeSteps < ActiveRecord::Migration[6.0]
  def change
    create_table :recipe_steps do |t|
      t.string :step1,  null: false
      t.string :step2,  null: false
      t.string :step3,  null: false
      t.string :step4,  null: false
      t.string :step5
      t.string :step6
      t.string :step7
      t.string :step8
      t.string :step9
      t.string :step10

      t.references :recipe,   foregin_key: true


      t.timestamps
    end
  end
end
