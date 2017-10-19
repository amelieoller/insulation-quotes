class Application < ApplicationRecord
  belongs_to :quote
  has_one :insulation_type
end
