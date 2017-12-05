class AccessorySerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :quotes, serializer: AccessoryQuoteSerializer
end
