class UserStocksController < ApplicationController
    
    def index
        mystocks = UserStock.all
        render json: mystocks
    end

    def create
        mystock = UserStock.create!(stock_params)
        render json: mystock, status: :created
    end

    def destroy
        # if user_stock.user_id == current_user.id
        #     mystock = UserStock.find(params[:id])
        #     mystock.destroy
        #     render json: mystock
        # else
        #     render json: { error: "You can only delete your own stocks" }, status: :unauthorized
        # end
        find_user_stock.destroy
        head :no_content
    end

    def update
        find_user_stock.update!(user_stock_params)
        render json: find_user_stock, status: :accepted
    end

    private

    def user_stock_params
        params.permit(:quantity, :stock_id, :user_id)
    end

    def find_user_stock
        mystock = UserStock.find(params[:id])
    end

end
