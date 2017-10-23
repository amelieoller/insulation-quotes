class Application < ApplicationRecord
  belongs_to :quote  
  has_many :applications_insulation_types
  has_many :insulation_types, through: :applications_insulation_types
end
