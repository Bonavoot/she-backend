class UsersController < ApplicationController

    # no auth needed to create a new user
    skip_before_action :authorize, only: [:create, :me, :index, :show]

    def index
        users = User.all
        render json: users
    end

    def show
        watchlist_record = WatchlistRecord.where(user_id: params[:id])
        watchlist_record_hash = watchlist_record.map do |record|
            {symbol: record.stock.symbol}
        end
        render json: watchlist_record_hash
    end



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
    def me
        if current_user
            user = User.find(params[:id])
            render json: current_user, status: :ok, methods: :display
        end
    end
    

    def update
        current_user.update!(user_params)
        render json: current_user
    end

    def destroy
       current_user.destroy
        head :no_content 
    end

    private

    def user_params
        params.permit(:name, :username, :password, :password_confirmation, :total_balance, :buying_power)
    end

    def display
        user = User.find(params[:id])
        @watchlist_records = user.watchlist_records.select! { |s| s.user_id == current_user.id }
        render json: @watchlist_records
    end
end