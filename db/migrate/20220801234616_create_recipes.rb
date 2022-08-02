class CreateRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.text :description
      t.integer :servings
      t.string :prep_time
      t.string :cook_time
      t.boolean :sprouty_pie
      t.boolean :lollys_pantry

      t.timestamps
    end
  end
end
