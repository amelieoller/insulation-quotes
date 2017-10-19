class QuotesController < ApplicationController

   def new
      @quote = Quote.new
   end

   def create
      @quote = current_user.quotes.build(quote_params)
      if @quote.save
         redirect_to quote_path(@quote)
      else
         render :new
      end
   end

   def show
      @quote = Quote.find(params[:id])
   end

   def index
      @quotes = Quote.all      
   end

   private

   def quote_params
      params.require(:quote).permit(
         :customer_name,
         :street,
         :city,
         :zip_code,
         :state
      )
   end

end
