class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :username, :password_digest, :total_balance, :buying_power
end

