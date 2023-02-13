class StockSerializer < ActiveModel::Serializer
  attributes :id, :name, :symbol, :price, :volume
end
