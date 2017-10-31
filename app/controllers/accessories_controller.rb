class AccessoriesController < ApplicationController
   before_action :authenticate_user!   
   before_action :find_accessory, only: [:show, :edit, :update, :destroy]

   def index
      @accessories = Accessory.all
   end

   def show
   end

   def new
      @accessory = Accessory.new
   end

   def create
      # Find or create by "case-insensitive"
      name = accessory_params[:name]
      @accessory = Accessory.where('lower(name) = ?', name.downcase).first 
      @accessory ||= Accessory.create(accessory_params)

      if @accessory.save
         redirect_to accessory_path(@accessory)
      else
         render :new
      end
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

   def destroy
      @accessory.destroy
      redirect_to accessories_path
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
