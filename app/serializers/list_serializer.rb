class ListSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :private
end
