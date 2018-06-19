class RecipeIngredient < ActiveRecord::Base
	
	belongs_to :recipe
	belongs_to :ingredient
	validates :recipe_id, presence: true
	validates :ingredient_id, presence: true

	accepts_nested_attributes_for :ingredient,
								  :reject_if => :all_blank
	
end
