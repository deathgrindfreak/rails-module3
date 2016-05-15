class RecipesController < ApplicationController
  def index
    query = params[:search] ||= 'chocolate'
    @recipes = Recipe.for(query)
  end
end
