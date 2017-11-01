class Application < ApplicationRecord
  belongs_to :quote  
  has_many :applications_insulation_types
  has_many :insulation_types, through: :applications_insulation_types

  validates :square_foot_price, presence: true
  validates :description, presence: true
  validates :length, presence: true
  validates :height, presence: true
end
