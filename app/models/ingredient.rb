class Ingredient < ActiveRecord::Base
	before_save { self.name = name.downcase }
	has_many :recipe_ingredients 
	has_many :recipes, :through => :recipe_ingredients
end
