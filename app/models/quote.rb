class Quote < ApplicationRecord
  belongs_to :user
  has_many :applications
  has_many :insulation_types, through: :applications
  accepts_nested_attributes_for :applications

  validates :customer_name, presence: true
  validates :street, presence: true
  validates :city, presence: true
  validates :zip_code, presence: true
  validates :state, presence: true
end
