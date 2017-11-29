class Quote < ApplicationRecord
  belongs_to :user
  # belongs_to :customer  
  has_many :applications, dependent: :destroy
  has_many :insulation_types, through: :applications
  has_many :accessories_quotes
  has_many :accessories, through: :accessories_quotes
  
  accepts_nested_attributes_for :applications, allow_destroy: true

  def accessories_attributes=(accessories_hashes)
    accessories_hashes.each do |i, accessory_attributes|
      if accessory_attributes[:name].present?
        # Find or create by "case-insensitive"
        name = accessory_attributes[:name]
        accessory = Accessory.where('lower(name) = ?', name.downcase).first 
        accessory ||= Accessory.create(name: name)

        if !self.accessories.include?(accessory)
          self.accessories_quotes.build(accessory: accessory)
        end
      end
    end
  end

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

  def self.from_today
    where('created_at >= ?', Time.zone.today.beginning_of_day)
  end

  def self.old
    where('created_at < ?', Time.zone.today.beginning_of_day)
  end
    
end
