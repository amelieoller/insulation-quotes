class Quote < ApplicationRecord
  belongs_to :user
  has_many :applications
  has_many :insulation_types, through: :applications
  accepts_nested_attributes_for :applications
end
