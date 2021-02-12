class TypesController < ApplicationController
    before_action :redirect_if_not_logged_in

   def show
    @type = Type.find(params[:id])
   end

   def new
    @type = Type.new
    # @type.items.build()
   end

   def create
    @type = current_user.types.build(type_params)
    if @type.save
        redirect_to type_path(@type)
    else
        flash[:message] = "This storage type already exists."
        render :new
    end
   end

   def index
    @types = current_user.types
   end

   private

   def type_params
    params.require(:type).permit(:name)
   end

end
