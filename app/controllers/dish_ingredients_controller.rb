class DishIngredientsController < ApplicationController

  def create
    DishIngredient.create(dish_id: params[:id], ingredient_id: params[:ingredient_id])
    redirect_to "/dishes/#{params[:id]}"
  end
end