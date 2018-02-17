class ListSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :private, :created_at, :updated_at
end
