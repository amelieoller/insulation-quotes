class InsulationTypeSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :coverage, :r_value, :thickness, :width, :facing, :price
end
