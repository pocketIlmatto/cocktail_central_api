class Recipe < ActiveRecord::Base
	validates :name, presence: true, uniqueness: { case_sensitive: false }
	
	has_many :recipe_ingredients
	has_many :ingredients, :through => :recipe_ingredients 
	
	accepts_nested_attributes_for :recipe_ingredients,
									:reject_if => :all_blank,
									:allow_destroy => true

	accepts_nested_attributes_for :ingredients
end
