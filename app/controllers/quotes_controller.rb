class QuotesController < ApplicationController
   before_action :find_quote, only: [:show, :edit, :destroy, :update]

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
         :state
      )
   end

   def find_quote
      @quote = Quote.find(params[:id])
   end

end
