class ItemsController < ApplicationController

    def new
        @item = Item.new
    end

    def create
        @item = current_user.items.build(item_params)
        binding.pry
        if @item.save
            redirect_to items_path
        else
            render :new
        end
    end

    private

    def item_params
        params.require(:item).permit(:name, :quantity, :user_id, :type_id)
    end

end
