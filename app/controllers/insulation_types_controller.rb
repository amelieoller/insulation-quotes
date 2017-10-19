class InsulationTypesController < ApplicationController

   before_action :find_insulationtype, only: [:show, :edit, :destroy, :update]

   def new
      @insulationtype = InsulationType.new
   end

   def create
      @insulationtype = InsulationType.new(insulationtype_params)
      if @insulationtype.save
         redirect_to insulation_type_path(@insulationtype)
      else
         render :new
      end
   end

   def show
   end

   def index
      @insulation_types = InsulationType.all      
   end

   def edit
   end

   def destroy
      @insulationtype.destroy
      redirect_to insulation_types_path
   end

   def update
      @insulationtype.update(insulationtype_params)
      redirect_to insulation_type_path(@insulationtype)
   end

   private

   def insulationtype_params
      params.require(:insulation_type).permit(
         :name,
         :oc,
         :framing,
         :r_value,
         :thickness,
         :width,
         :facing,
         :price
      )
   end

   def find_insulationtype
      @insulationtype = InsulationType.find(params[:id])
   end

end
