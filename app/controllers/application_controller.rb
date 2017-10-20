class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def calculate_quote(params)

    application = params[:quote][:applications_attributes]["0"]
    @length = application[:length].to_i 
    @oc = application[:oc].to_i
    @framing = application[:framing]
    @r_value = application[:r_value].to_i
    @depth = application[:depth].to_i
    @width = application[:width].to_i 
    @height = application[:height].to_i 
    @vapor_barrier = application[:vapor_barrier]

    def material_width
      if @framing == "conventional" # Conventioal framing
        new_width = @oc + 1        
        material_width = new_width unless !InsulationType.where("width == ?", @new_width).empty?
      else
        material_width = @oc
      end
      material_width      
    end
    
    def facing_type
      if @vapor_barrier == "membrain" || @vapor_barrier == "visqueen"
        insulation_facing_type = "unfaced"
      else
        insulation_facing_type = @vapor_barrier
      end
      insulation_facing_type
    end

    def chosen_insulation
      InsulationType.where("thickness <= ? AND r_value >= ?", @depth, @r_value).where("width = ?", material_width).where("facing like ?", facing_type).order(price: :asc).first   
    end

    def bags_needed
      if chosen_insulation
        (@length * @height) / chosen_insulation.coverage.to_i        
      end
    end

    {chosen_insulation: chosen_insulation, bags_needed: bags_needed, facing_type: facing_type}

  end
 
end
