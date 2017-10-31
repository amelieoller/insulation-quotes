class AccessoriesController < ApplicationController

   before_action :find_accessory, only: [:show, :edit, :update]

   def index
      @accessories = Accessory.all
   end

   def show
   end

   def new
      @accessory = Accessory.new
   end

   def create
      accessory = Accessory.find_or_create_by(accessory_params)
      redirect_to accessory_path(accessory)
   end

   def edit
   end

   def update
      if @accessory.update(accessory_params)
         flash[:success] = "Your accessory was successfully updated!"
         redirect_to accessory_path(@accessory)
      else
         render :edit
      end
   end

   private

   def accessory_params
      params.require(:accessory).permit(:name)
   end

   def find_accessory
      @accessory = Accessory.find(params[:id])
   rescue ActiveRecord::RecordNotFound
      flash[:info] = "This accessory was not found"
      redirect_to accessories_path
   end

end
