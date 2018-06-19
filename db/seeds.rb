def get_ingredient(ingredients, recipe_id)
  ingredients.each do |k,v|
    value = v || k
    if value.is_a?(Hash)
      if value.has_key?('ingredientName')
        ingredient_name = value['ingredientName']
      elsif value.has_key?('name')
        ingredient_name = value['name']
      end
    
      uom = nil
      qty = nil
      if value.has_key?('amountUnits')
        uom = value['amountUnits']
        qty = value['amount'] if value.has_key?('amount')
      elsif value.has_key?('amount')
        match_data = /^([0-9\/. ]*) ?(\D*)$/.match(value['amount'])
        if match_data
          qty = match_data[1].split.map { |r| Rational(r) }.inject(:+).to_f if match_data.length > 0
          uom = match_data[2] if match_data.length > 1
        else
          qty = value['amount']
        end
      end

      ingredient = Ingredient.find_or_initialize_by(name: ingredient_name.downcase)
      ingredient.display_name = ingredient_name
      ingredient.save!

      recipe_ingredient = RecipeIngredient.find_or_initialize_by(ingredient_id: ingredient.id, recipe_id: recipe_id)
      recipe_ingredient.uom = uom if uom
      recipe_ingredient.qty = qty if qty
      recipe_ingredient.save!
    elsif value.is_a?(Array)
      get_ingredient(value, recipe_id)
    end
  end
end

def valid_json? json_
  JSON.parse(json_)
    return true
  rescue JSON::ParserError => error
    puts "JSON error: #{error}"
    return false
end

recipes = File.read('db/seeds_data/cocktails.json')
recipe_count = 0
if valid_json?(recipes)
  Recipe.transaction do
    JSON.parse(recipes).each do |recipe_json|
      if recipe_json.has_key?('name')
        recipe_name = recipe_json['name']
        recipe = Recipe.find_or_initialize_by(name: recipe_name)
        recipe.save!
        ingredients = recipe_json['ingredients']
        if ingredients.is_a?(Array)
          get_ingredient(ingredients, recipe.id)
        else
          puts "Opps.. ingredients is not an array: #{ingredients}"
        end
        recipe_count += 1
      end
    end
  end
end

puts "#{recipe_count} recipe(s) created"
puts 'Units of measure:'
puts "#{RecipeIngredient.all.pluck(:uom).uniq}"
