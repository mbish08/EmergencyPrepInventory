class TypesController < ApplicationController

   def show
    @type = Type.find(params[:id])
   end

   def new
    @type = Type.new
    # @type.items.build()
   end

   def create
    
   end

   private

   def type_params
    params.require(:type).permit(:name, items_attributes: [:name, :quantity])
   end

end
