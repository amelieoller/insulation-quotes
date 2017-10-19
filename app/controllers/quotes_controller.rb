class QuotesController < ApplicationController
   before_action :find_quote, only: [:show, :edit, :destroy, :update]

   def new
      @quote = Quote.new
      @quote.applications.build
   end

   def create
      @quote = current_user.quotes.build(quote_params)
      if @quote.save
         redirect_to quote_path(@quote), alert: 'Your quote was successfully created'
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
            :vapor_barrier
         ]
      )
   end

   def find_quote
      @quote = Quote.find(params[:id])
   end

end
