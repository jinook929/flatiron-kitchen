class IngredientsController < ApplicationController
  def index
    @ingredients = Ingredient.all
  end

  def show
    @ingredient = Ingredient.find(params[:id])
  end

  def new
    @ingredient = Ingredient.new
    @ingredient.recipes.build
  end

  def create
    @ingredient = Ingredient.create(ingredient_params)
    redirect_to @ingredient
  end

  def edit
    @ingredient = Ingredient.find(params[:id])
    @ingredient.recipes.build
  end

  def update
    @ingredient = Ingredient.find(params[:id])
    @ingredient.update(ingredient_params)
    redirect_to @ingredient
  end

  private

  def ingredient_params
    params.require(:ingredient).permit(:name, recipe_ids: [])
  end
end
