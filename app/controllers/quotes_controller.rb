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
         @quote.calculate_quote
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
         @quote.calculate_quote
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
   rescue ActiveRecord::RecordNotFound
      flash[:info] = "This quote was not found"
      redirect_to quotes_path
   end

end
