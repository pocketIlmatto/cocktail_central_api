class CreateRecipeIngredients < ActiveRecord::Migration[5.2]
  def change
    create_table :recipe_ingredients do |t|
      t.references :ingredient, index: true
      t.references :recipe, index: true

      t.decimal :qty
      t.string :uom
      t.timestamps
    end
  end
end
