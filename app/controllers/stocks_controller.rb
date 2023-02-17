class StocksController < ApplicationController
    skip_before_action :authorize, only: [:index, :show]

    def index
        stocks = Stock.all
        render json: stocks
    end

    def show
        stock = Stock.find(params[:id])
        render json: stock
    end

end
