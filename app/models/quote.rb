class Quote < ApplicationRecord
  belongs_to :user
  has_many :applications, dependent: :destroy
  has_many :insulation_types, through: :applications
  # accepts_nested_attributes_for :applications, allow_destroy: true

  # validates :customer_name, presence: true
  # validates :street, presence: true
  # validates :city, presence: true
  # validates :zip_code, presence: true
  # validates :state, presence: true

  def applications_attributes=(applications_attributes)
    applications_attributes.each do |_i, application_attributes|
      self.applications.build(application_attributes)
    end
  end

end
