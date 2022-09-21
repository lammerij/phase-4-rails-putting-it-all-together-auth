class RecipesController < ApplicationController

  def index
    recipes = Recipe.all
    if recipes
      render json: recipes, status: :created
    else
      render json: { errors: [] }, status: :unauthorized
    end
  end

  def create
    user = User.find_by(id: session[:user_id])
    new_recipe = user.recipes.create(recipe_params)
    if new_recipe.valid?
      render json: new_recipe, status: :created
    else
      render json: { errors: ["Please enter valid data"] }, status: :unprocessable_entity
    end
  end

  private

  def recipe_params
    params.permit(:title, :instructions, :minutes_to_complete)
  end
end
