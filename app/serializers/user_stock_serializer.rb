class UserStockSerializer < ActiveModel::Serializer
  attributes :id, :quantity
  has_one :user
  has_one :stock
end
