class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :password, :created_at, :updated_at
end
