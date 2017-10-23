class ApplicationsInsulationType < ApplicationRecord
   belongs_to :application
   belongs_to :insulation_type
end