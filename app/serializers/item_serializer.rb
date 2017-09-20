class ItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :completed, :completed_at
end
