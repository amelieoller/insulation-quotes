class QuotesController < ApplicationController
   before_action :authenticate_user!  
   before_action :find_quote, only: [:show, :edit, :destroy, :update]

   def new
      @quote = Quote.new
      @quote.applications.build
      @insulation_types = InsulationType.all
   end

   def create
      @quote = current_user.quotes.build(quote_params)
      if @quote.save
         calculate_quote
         flash[:success] = "Your quote was successfully created!"
         redirect_to quote_path(@quote)
      else         
         render :new
      end
   end

   def show
   end

   def index
      @quotes = Quote.all      
   end

   def edit
   end

   def destroy
      @quote.destroy
      flash[:info] = "Your quote has been deleted!"
      redirect_to quotes_path
   end

   def update
      if @quote.update(quote_params)
         calculate_quote
         flash[:success] = "Your quote was successfully updated!"
         redirect_to quote_path(@quote)
      else
         render :edit
      end
   end

   private

   def quote_params
      params.require(:quote).permit(
         :customer_name,
         :street,
         :city,
         :zip_code,
         :state,
         applications_attributes: [
            :_destroy,
            :id,
            :application_type,
            :description,
            :oc,
            :framing,
            :r_value,
            :depth,
            :length,
            :width,
            :height,
            :vapor_barrier,
            :square_foot_price,
            :insulation_type_ids,
            :manual_override
         ]
      )
   end

   def find_quote
      @quote = Quote.find(params[:id])
   end

   def calculate_quote

      # Iterate over applications
      @quote.applications.each do |application|

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
