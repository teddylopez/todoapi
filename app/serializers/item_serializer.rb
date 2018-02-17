class ItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :completed, :completed_at, :created_at, :updated_at
end
