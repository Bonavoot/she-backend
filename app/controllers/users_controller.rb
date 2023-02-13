class UsersController < ApplicationController

    # no auth needed to create a new user
    skip_before_action :authorize, only: [:create, :show]

    # Sign Up Feature
    def create
        # Save a new user to the database with their username, encrypted password, and balance
        user = User.create!(user_params)
        # Save the user's ID in the session hash
        session[:user_id] = user.id
        # Return a JSON response with the user's ID, name, username, and balance; and an HTTP status code of 201 (Created)
        render json: user, status: :created
    end

    # Auto-login Feature
    def show
        if current_user
            render json: current_user
        else 
            render json: "No current session stored", status: :unauthorized
        end
    end
    
    def update
        find_user.update!(user_params)
        render json: find_user, status: :accepted
    end

    def destroy 
        find_user.destroy
        head :no_content 
    end

    private

    def user_params
        params.permit(:name, :username, :password, :password_confirmation)
    end

    def find_user
        user = User.find(params[:id])
    end

end
