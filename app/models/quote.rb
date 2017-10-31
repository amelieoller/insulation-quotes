class Quote < ApplicationRecord
  belongs_to :user
  has_many :applications, dependent: :destroy
  has_many :insulation_types, through: :applications
  has_many :quotes_accessories
  has_many :accessories, through: :quotes_accessories
  
  accepts_nested_attributes_for :applications, allow_destroy: true

  # def applications_attributes=(applications_attributes)
  #   applications_attributes.each do |i, application_attributes|
  #     if has_destroy_flag?(application_attributes)
  #       self.mark_for_destruction
  #     else
  #       self.applications.build(application_attributes)
  #     end
  #   end
  # end




  #   application_attributes.each do |i, attributes|
  #     if attributes.respond_to?(:permitted?)
  #       attributes = attributes.to_h
  #     end
  
  #     if attributes["id"].blank?
  #       unless reject_new_record?(association_name, attributes)
  #         self.applications.build(attributes)
  #       end
  #     else
  #       target_record = applications.detect { |record| record.id.to_s == attributes["id"].to_s }
  #       if target_record
  #         existing_record = target_record
  #       else
  #         self.add_to_target(existing_record, :skip_callbacks)
  #       end
  #       assign_to_or_mark_for_destruction(existing_record, attributes, :allow_destroy)
  #     end
  #   end

  #   def assign_to_or_mark_for_destruction(record, attributes, allow_destroy)
  #     record.assign_attributes(attributes)
  #     record.mark_for_destruction if has_destroy_flag?(attributes)
  #   end
   
  # end



    

    # # Determines if a hash contains a truthy _destroy key.
    # def has_destroy_flag?(hash)
    #   Type::Boolean.new.cast(hash["_destroy"])
    # end

    # # Determines if a new record should be rejected by checking
    # # has_destroy_flag? or if a <tt>:reject_if</tt> proc exists for this
    # # association and evaluates to +true+.
    # def reject_new_record?(association_name, attributes)
    #   will_be_destroyed?(association_name, attributes) || call_reject_if(association_name, attributes)
    # end

    # # Determines if a record with the particular +attributes+ should be
    # # rejected by calling the reject_if Symbol or Proc (if defined).
    # # The reject_if option is defined by +accepts_nested_attributes_for+.
    # #
    # # Returns false if there is a +destroy_flag+ on the attributes.
    # def call_reject_if(association_name, attributes)
    #   return false if will_be_destroyed?(association_name, attributes)

    #   case callback = nested_attributes_options[association_name][:reject_if]
    #   when Symbol
    #     method(callback).arity == 0 ? send(callback) : send(callback, attributes)
    #   when Proc
    #     callback.call(attributes)
    #   end
    # end

    # # Only take into account the destroy flag if <tt>:allow_destroy</tt> is true
    # def will_be_destroyed?(association_name, attributes)
    #   allow_destroy?(association_name) && has_destroy_flag?(attributes)
    # end

    # def allow_destroy?(association_name)
    #   nested_attributes_options[association_name][:allow_destroy]
    # end

    # def raise_nested_attributes_record_not_found!(association_name, record_id)
    #   model = self.class._reflect_on_association(association_name).klass.name
    #   raise RecordNotFound.new("Couldn't find #{model} with ID=#{record_id} for #{self.class.name} with ID=#{id}",
    #                             model, "id", record_id)
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
