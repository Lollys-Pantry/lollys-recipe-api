class CreateCookingSteps < ActiveRecord::Migration[7.0]
  def change
    create_table :cooking_steps do |t|
      t.integer :step
      t.text :description
      t.references :recipe, null: false, foreign_key: true
      t.timestamps
    end
  end
end
