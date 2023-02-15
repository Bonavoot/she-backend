class User < ApplicationRecord
    has_secure_password

    has_many :user_stocks
    has_many :stocks, through: :user_stocks


    # validates :name, presence: true, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }
    # validates :username, presence: true, uniqueness: true, length: { minimum: 3, maximum: 15 }, format: { with: /\A[a-zA-Z0-9]+\z/, message: "only allows letters and numbers" } 
    # validates :password, presence: true, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }
    # validates :balance, numericality: { greater_than_or_equal_to: 0, message: "must have a positive balance"}

  
  
    private

    def buy_stock
      current_user.balance -= (stock.price * user_stock.quantity)
    end

    def sell_stock
      current_user.balance += (stock.price * user_stock.quantity)
    end

end
