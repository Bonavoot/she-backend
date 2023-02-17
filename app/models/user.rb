class User < ApplicationRecord
    has_secure_password

    has_many :user_stocks
    has_many :stocks, through: :user_stocks

    has_many :watchlist_records
    has_many :stocks, through: :watchlist_records


    # validates :email, presence: true, uniqueness: true, format: { with: /\A[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}\z/, message: "must be a valid email address" }

    validates :password, confirmation: true
    validates :password_confirmation, presence: true

    # validates :buying_power, numericality: { greater_than_or_equal_to: 0, message: "must have a positive buying power"}

    validates :name, presence: true, length: { minimum: 3, maximum: 25 }, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }
    validates :username, presence: true, uniqueness: true, length: { minimum: 3, maximum: 15 }, format: { with: /\A[a-zA-Z0-9]+\z/, message: "only allows letters and numbers" } 


    private
  
    def buy_stock
      current_user.balance -= (stock.price * user_stock.quantity)
    end

    def sell_stock
      current_user.balance += (stock.price * user_stock.quantity)
    end

    def update_buying_power_on_buy
      current_user.buying_power = current_user.buying_power - (stock.price * user_stock.quantity)
    end

    def update_buying_power_on_sell
      current_user.buying_power = current_user.buying_power + (stock.price * user_stock.quantity)
    end
    
end
