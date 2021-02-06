class TypesController < ApplicationController

    def new
        @type = Type.new
    end

    def create
        @type = current_user.types.build(type_params)
        # binding.pry
        if @type.save
            redirect_to types_path
        else
            render :new
        end
    end

    private

    def type_params
        params.require(:type).permit(:name)
    end

end
