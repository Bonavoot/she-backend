class Stock < ApplicationRecord
    has_many :user_stocks
    has_many :users, through: :user_stocks


    private

    def randomize_price_per_day
        self.price = price + (price * rand(-0.2..0.2))
    end

end
