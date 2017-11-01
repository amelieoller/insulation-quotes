class InsulationType < ApplicationRecord
   has_many :applications_insulation_types
   has_many :applications, through: :applications_insulation_types

   def self.select_width(width)
      where(width: width.to_f)
   end
end