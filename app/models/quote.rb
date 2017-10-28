class Quote < ApplicationRecord
  belongs_to :user
  has_many :applications, dependent: :destroy
  has_many :insulation_types, through: :applications
  accepts_nested_attributes_for :applications, allow_destroy: true

  # validates :customer_name, presence: true
  # validates :street, presence: true
  # validates :city, presence: true
  # validates :zip_code, presence: true
  # validates :state, presence: true

  # def applications_attributes=(applications_attributes)
  #   applications_attributes.each do |i, application_attributes|
  #     self.applications.build(application_attributes)
  #   end
  # end


  def calculate_quote
    
    # Iterate over applications
    self.applications.each do |application|

      # Create instance variables and set them equal to the value for each
      application.attributes.each do |key, value|
        next if key.include?("id")
        instance_variable_set("@#{key}", value)
      end

      # Check Material width
      def material_width
        if @framing == "Conventional"
            new_width = @oc - 1        
            material_width = new_width unless !InsulationType.where("width == ?", @new_width).empty?
        else
            material_width = @oc
        end
        material_width      
      end
      
      # Check facing type
      def facing_type
        if @vapor_barrier == "Membrain" || @vapor_barrier == "Visqueen"
            facing = "Unfaced"
        else
            facing = @vapor_barrier
        end
        facing
      end

      # Find the insulation type that fits all the requirements and persit it in the database
      def chosen_insulation
        chosen_insulation = InsulationType.where("thickness <= ? AND r_value >= ? AND facing like ?", @depth, @r_value, facing_type).where("width = ? OR width = ?", material_width, @oc)
      end

      if !application.manual_override
        application.insulation_types = chosen_insulation                
      end

    end

  end
    
end
