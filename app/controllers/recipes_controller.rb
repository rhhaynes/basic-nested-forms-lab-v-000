require 'pry'
class RecipesController < ApplicationController

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    @recipe.ingredients.build
    @recipe.ingredients.build
  end

  def create
    binding.pry
    @recipe = Recipe.new(recipe_params)
    if !!@recipe.save then redirect_to recipe_path(@recipe)
    else render :new
    end
  end
  
  def show
    @recipe = Recipe.find(params[:id])
  end
  
  private
  
  def recipe_params
    params.require(:recipe).permit(:title, :ingredients => [:name, :quantity])
  end
end
