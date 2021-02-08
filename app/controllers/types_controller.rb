class TypesController < ApplicationController

   def show
    @type = Type.find(params[:id])
   end

   def new
    @type = Type.new
    # @type.items.build()
   end

   def create
    @type = Type.new(type_params)
    if @type.save
        redirect_to type_path(@type)
    else
        flash[:message] = "This storage type already exists."
        render :new
    end
   end

   def index
    @types = Type.all
   end

   private

   def type_params
    params.require(:type).permit(:name)
   end

end
