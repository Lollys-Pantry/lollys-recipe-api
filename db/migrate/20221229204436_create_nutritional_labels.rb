class CreateNutritionalLabels < ActiveRecord::Migration[7.0]
  def change
    create_table :nutritional_labels do |t|
      t.string :serving_size
      t.string :calories
      t.string :total_fat
      t.string :saturated_fat
      t.string :sodium
      t.string :carbohydrates
      t.string :fiber
      t.string :sugar
      t.string :protein
      t.belongs_to :recipe, null: false, foreign_key: true
      
      t.timestamps
    end
  end
end
