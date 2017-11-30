class ApplicationSerializer < ActiveModel::Serializer
   ### Display all columns:
   # attributes *Application.column_names
   
   attributes :id, :insulation_types
   has_many :insulation_types
end
