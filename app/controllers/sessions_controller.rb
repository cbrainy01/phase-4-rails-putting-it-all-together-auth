class SessionsController < ApplicationController

    def create
        user = User.find_by(username: params[:username])
        # byebug
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            render json: user, status: 201
        else
            render json: { errors: ["Authentication failed"] }, status: :unauthorized
        end
    end

    def destroy
        user = User.find_by(id: session[:user_id])
        if user
           session[:user_id] = nil
            head :no_content
        else
            render json: {errors: ["user not logged in"]}, status: 401
        end
        
    end

end
