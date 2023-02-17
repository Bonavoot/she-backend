class WatchlistRecordSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :stock_id
  has_one :user
  has_one :stock
end
