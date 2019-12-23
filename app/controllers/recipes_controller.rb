class RecipesController < ApplicationController
    before_action :authenticate_user!
    def index
        # @recipes = Recipe.all
        @recipes = Recipe.where(user_id: current_user.id)
      end
    
      def show
        @recipe = Recipe.find(params[:id])
        # render json: @recipe, include: :ingredients
      end
    
      def new
        @recipe = Recipe.new
      end
    
      def create    
        @recipe = Recipe.new(recipe_params) 
        @recipe.user_id = current_user.id
        @recipe.save
        redirect_to @recipe
      end
    
      private
    
        def recipe_params
          params.require(:recipe).permit(:name, :ingredient_ids => [])
        end
end
