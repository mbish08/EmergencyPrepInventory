class TypesController < ApplicationController
    before_action :redirect_if_not_logged_in

   def new
    @type = Type.new
   end

   def create
    @type = current_user.types.build(type_params)
    if @type.save
        redirect_to type_items_path(@type)
    else
        flash[:message] = "This storage type already exists."
        render :new
    end
   end

   def index
    @types = Type.all.alpha
   end

   private

   def type_params
    params.require(:type).permit(:name)
   end

end
