class Api::V1::RecipesController < Api::V1::BaseController
  
  def index
    respond_with Recipe.all.limit(10)
  end

  private

  def recipe_params
    params.require(:recipe).permit(:id, :name)
  end

end