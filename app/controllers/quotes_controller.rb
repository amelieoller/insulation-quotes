class QuotesController < ApplicationController
   before_action :authenticate_user!     
   before_action :find_quote, only: [:show, :edit, :destroy, :update]
   before_action :calculate_quote, only: [:create]

   def new
      @quote = Quote.new
      2.times{
         @quote.applications.build
      }
      @insulation_types = InsulationType.all
      @framing = [{name: "tgi"}, {name: "convent"}]
   end

   def create
      if @quote.save
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
      redirect_to quotes_path
   end

   def update
      @quote.update(quote_params)
      redirect_to quote_path(@quote)
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
            :square_foot_price
         ]
      )
   end

   def find_quote
      @quote = Quote.find(params[:id])
   end

   def calculate_quote
      @quote = current_user.quotes.build(quote_params)

      # Set instance variables
      @quote.applications.first.attributes.each do |key, value|
         next if key.include?("id")
         instance_variable_set("@#{key}", value)
      end

      # Iterate over applications
      @quote.applications.each do |application|

         def material_width
            if @framing == "conventional" # Conventioal framing
               new_width = @oc - 1        
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

         application.insulation_type = chosen_insulation
         application.bags_needed = bags_needed
      end
   end
end
