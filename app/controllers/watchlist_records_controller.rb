class WatchlistRecordsController < ApplicationController
    skip_before_action :authorize, only: [:index, :create, :destroy]
    

    def index
        watchlist_records = WatchlistRecord.all
        render json: watchlist_records
    end

    def create
        watchlist_record = WatchlistRecord.create!(watchlist_record_params)
        render json: watchlist_record, status: :created
    end

    def destroy
        find_watchlist_record.destroy
        head :no_content
    end

    private

    def watchlist_record_params
        params.permit(:user_id, :stock_id)
    end

    def find_watchlist_record
        watchlist_record = WatchlistRecord.find(params[:id])
    end

    def current_user
        @current_user ||= User.find_by(id: session[:user_id])
    end
  
end
