class RecipesController < ApplicationController
    # rescue_from ActiveRecord::RecordInvalid, with: :invalid_recipe_message
    before_action :authorize    
    rescue_from ActiveRecord::RecordInvalid, with: :invalid_recipe_message

    def index
        recipes = Recipe.all 
        render json: recipes, status: 201
    end

    def create
       user = User.find_by(id: session[:user_id])
       recipe = user.recipes.create!(recipe_params)
       render json: recipe, status: 201
    #    if recipe.valid?
    #     render json: recipe, status: 201
    #    else
    #     render json: {errors: recipe.errors.full_messages}, status: :unprocessable_entity
    #    end
        
    end

    private

    def invalid_recipe_message
        render json: { errors: ["recipe invalid"] }, status: :unprocessable_entity
    end

    def render_unprocessable_entity_response(exception)
        render json: { errors: exception.record.errors.full_messages }, status: :unprocessable_entity
      end

    def authorize
        user = User.find_by(id: session[:user_id])
        return render json: { errors: ["Not authorized"] }, status: 401 unless user
        # session[:user_id].include? :user.id
    end

    def recipe_params
        params.permit(:title, :instructions, :minutes_to_complete)
    end

end
