class InsulationType < ApplicationRecord
   has_many :applications_insulation_types
   has_many :applications, through: :applications_insulation_types
end