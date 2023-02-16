class Stock < ApplicationRecord
    has_many :user_stocks
    has_many :users, through: :user_stocks

    has_many :watchlist_records
    has_many :users, through: :watchlist_records
    
end
