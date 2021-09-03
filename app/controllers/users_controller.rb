class UsersController < ApplicationController

# rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
# before_action :authorize    
# skip_before_action :authorize, only: [:create]

    def create
        # user = User.create!(user_params)
        # session[:user_id] = user.id
        # render json: user, status: 201
        user = User.new(user_params)
        if user.valid? 
            # byebug
            user.save
            session[:user_id] = user.id 
            render json: user, status: 201
        else
            render json: { errors: user.errors.full_messages }, status: 422
        end
    end

    def show
        user = User.find_by(id: session[:user_id])
        return render json: { error: "Not authorized" }, status: 401 unless user
# session[:user_id].include? :user.id
        render json: user, status: 200
    end

    private

    def authorize
        user = User.find_by(id: session[:user_id])
        return render json: { error: "Not authorized" }, status: 401 unless user
        # session[:user_id].include? :user.id
    end

    def user_params
        params.permit(:username, :image_url, :bio, :password, :password_confirmation)
    end

    def render_unprocessable_entity_response(exception)
        render json: { errors: exception.record.errors.full_messages }, status: :unprocessable_entity
    end

end
